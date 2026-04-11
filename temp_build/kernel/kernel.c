
#include <stdint.h>
#include "csr.h"
#include "isr.h"
#include "format.h"
#include "sbi.h"
#include "syscall.h"
#include "kernel.h"
#include "vm.h"
#include "temp.h"

#define BADPID  (-1)
#define NULLSTK 4096 //sizeof page
#define NULLPROC 0

pid32 currpid = NULLPROC;

procent_t proctab[NPROC]; //init process table

static inline void init_proc_entry(pid32 pid)
{
    procent_t *p = &proctab[pid];
    p->prstate   = PR_FREE;
    p->prstkptr  = get_isr_stack_ptr(pid);
}

void init_proctab(void) {
    for (pid32 pid = 0; pid < NPROC; pid++) {
        init_proc_entry(pid);
    } 
}

pid32 ready_queue[NPROC]; // init process queue


static int rq_head;
static int rq_tail;

void rq_init() { //TODO SET NULLPROCESS AS PID0
    rq_head=0;
    rq_tail = 0;
    for (int i = 1; i < NPROC; i++) {
        //print("initialized process %d\n", i);
        ready_queue[i] = BADPID;
    }
}

void rq_push(pid32 pid) {
    int next_tail = (rq_tail + 1) % NPROC;
    if (next_tail == rq_head) {
        print("ready queue full\n");
        return;
    }

    ready_queue[rq_tail] = pid;
    rq_tail = next_tail;
}

pid32 rq_pop(void) {
    if (rq_head == rq_tail) return BADPID;
    pid32 pid = ready_queue[rq_head];
    ready_queue[rq_head] = BADPID;
    rq_head = (rq_head + 1) % NPROC;
    return pid;
}

pid32 pick_next_pid(void) {
    pid32 pid = rq_pop();
    if (pid == BADPID) return NULLPROC;
    return pid;
}

static pid32 newpid(void) {
    for (pid32 pid = 1; pid < NPROC; pid++) {   // skip NULLPROC
        if (proctab[pid].prstate == PR_FREE) {
            return pid;
        }
    }
    return BADPID;
}

void kill_process_kernel(void) // S-mode privileged kernel function
{
    pid32 pid = currpid;

    proctab[pid].prstate = PR_FREE;
    proctab[pid].prstkptr = 0;

    reschedule();
    __builtin_unreachable();
}

void kill(void) { //U-mode api that ecalls with exit code
    register uint32_t a7 asm("a7") = SYS_EXIT; //load exit code into a7
    asm volatile("ecall" : : "r"(a7) : "memory");
    for (;;) { }
}

pid32 create_process_kernel(void (*func)(void)) { //privileged, S-mode facing
    pid32 pid = newpid(); //grab a new free process 
    if (pid == BADPID) {
        return BADPID;
    }

    procent_t *p = &proctab[pid];

    uintptr_t thread_stack_top = (uintptr_t)get_thread_stack_ptr(pid);
    trapframe_t *tf = (trapframe_t *)get_isr_stack_ptr(pid);


    for (size_t i = 0; i < sizeof(*tf); i++) {
        ((uint8_t *)tf)[i] = 0;
    }

    tf->gpr[1] = (uint32_t)kill; // ra
    tf->gpr[2] = (uint32_t)thread_stack_top; // sp, process executes in THREAD STACK
    tf->epc    = (uint32_t)func; // whatever needs to be executed when this iss run
    tf->sr     = 0; // SET TO 0 DISABLE, DISABLES INTERRUPTS AFTER SRET, NEED TO BE ENABLED EVENTUALLY

    p->prstkptr = (char *) tf; //points to top of isr stack
    p->prstate  = PR_READY;

    rq_push(pid);
    print("process created\n");
    return pid;
}

int create(void (*func)(void)) { //U-mode API to request ecall
    // this function triggers an ecall, with SYS_CREATE code
    // loaded into register a7, which is decoded and points to
    // create_process_kernel() which should only be accessible
    // via S-mode
    register uint32_t a0 asm("a0") = (uint32_t)func;
    register uint32_t a7 asm("a7") = SYS_CREAT;

    asm volatile(
        "ecall"
        : "+r"(a0)
        : "r"(a7)
        : "memory"
    ); 

    return (int)a0;   // kernel returns pid in a0
}

void nullproc_body(void) {
    while (1) {
        asm volatile("wfi");
    }
}

//init nullprocess
void  nullproc_init(void) {
    procent_t *p = &proctab[NULLPROC];

    uintptr_t thread_stack_top = (uintptr_t)get_thread_stack_ptr(NULLPROC);
    trapframe_t *tf = (trapframe_t *)get_isr_stack_ptr(NULLPROC);

    for (size_t i = 0; i < sizeof(*tf); i++) {
        ((uint8_t *)tf)[i] = 0;
    }

    tf->gpr[1] = (uint32_t)kill;              // or exit stub if U-mode
    tf->gpr[2] = (uint32_t)thread_stack_top;  // initial SP
    tf->epc    = (uint32_t)nullproc_body;

    tf->sr     = SSTATUS_SPIE;                // if returning to U-mode
    // or different sr if we want nullproc in S-mode

    p->prstate   = PR_READY;      
    p->prstkptr  = get_isr_stack_ptr(0);//first ISR STACK 
}




int index = 0;
volatile uint64_t time_remaining = QUANTUM;

/*void reschedule_function() {
    index++;
    time_remaining = QUANTUM;
    print("Index increments. Index at %d\n", index);
*/

//TODO Pop off process queue then switch trapframe pointer 

void reschedule(void) {
    
    pid32 old = currpid;
    pid32 next = pick_next_pid();
    
    if (old == next) {
        return;
    }

    if (old != NULLPROC && proctab[old].prstate == PR_CURR) {
        proctab[old].prstate = PR_READY;
        rq_push(old);
    }

    currpid = next;
    proctab[next].prstate = PR_CURR;
    print("handling reschedule\n");
    print("next: %d\n", next);
    s_mode_trap_return((trapframe_t *) proctab[next].prstkptr);
    __builtin_unreachable();
}

void print_processes() {
    for (pid32 i = 0; i < NPROC; i++) {
        print("state of process %d: %d\n", i, proctab[i].prstate);
    }
}

void kernel_init(void) {
    init_proctab();
    nullproc_init();              // proctab[0] seeded + valid context/trapframe

    rq_init();                    // empty queue
    currpid = NULLPROC;
    proctab[NULLPROC].prstate = PR_CURR;

    // now enable timer interrupts / start scheduling
}

void s_mode_boot(void) {
    print("s_mode entered\n");

    // set up interrupts
    // DIRECT MODE for our trap handlers
    setup_interrupts_s(s_mode_trap_entry, IE_STIE);
    enable_interrupts_s();
    enable_prev_interrupts_s(); // so interrupts enabled in u-mode
    kernel_init();
    print("kernel initialized\n");

    //create/schedule main()
    create_process_kernel(main);
    print_processes();
    print("main created\n");
    //reschedule();


    // set up recurrint clock handler
    sbi_write_timer_offset((uint32_t) WAIT_INIT, (uint32_t)(WAIT_INIT >> 32));

    return;
}

void m_mode_boot(void* isr_stack_top, void* thread_stack_top) {
    setup_stacks(isr_stack_top, thread_stack_top);

    //kernel boot stuff later will get separated into kernel main or whatever
    setup_interrupts_m(m_mode_trap_entry, IE_MTIE | IE_MSIE | IE_MEIE); //
    print("m_mode table setup complete\n");

    uintptr_t pmpc = PMP_NAPOT | PMP_R | PMP_W | PMP_X;
    uintptr_t pmpa = ((uintptr_t)1 << (__riscv_xlen == 32 ? 31 : 53)) - 1;
    asm volatile ("la t0, 1f\n\t"
                        "csrrw t0, mtvec, t0\n\t"
                        "csrw pmpaddr0, %1\n\t"
                        "csrw pmpcfg0, %0\n\t"
                        ".align 2\n\t"
                        "1: csrw mtvec, t0"
                        : : "r" (pmpc), "r" (pmpa) : "t0");       
    enable_interrupts_m();
    delegate_traps_to_s(~(1 << EX_ECALL_SMODE), 0xFFFFFFFFu); //hard code to delegate all delegable ints to s mode for now
    print("finished delegating traps\n");
    //this is supposed to enter m-mode from s-mode and reach the timer handler supposedly
    return;
}
