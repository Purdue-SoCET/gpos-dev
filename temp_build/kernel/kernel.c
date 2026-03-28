
#include <stdint.h>
#include "csr.h"
#include "isr.h"
#include "format.h"
#include "sbi.h"
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


static int rq_head = 0;
static int rq_tail = 0;

void rq_init() { //TODO SET NULLPROCESS AS PID0
    ready_queue[0] = NULLPROC;
    for (int i = 1; i < NPROC; i++) {
        ready_queue[i] = BADPID;
    }
}

void rq_push(pid32 pid) {
    ready_queue[rq_tail] = pid;
    rq_tail = (rq_tail + 1) % NPROC;
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

//init nullprocess
void  nullproc_init(void) {
    procent_t *p = &proctab[NULLPROC];
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

void reschedule(void)
{
    
    pid32 old = currpid;
    pid32 next = pick_next_pid();

    if (old == next) {
        return;
    }

    if (old != NULLPROC && proctab[old].prstate == PR_CURR) {
        proctab[old].prstate = PR_READY;
    }

    currpid = next;
    proctab[next].prstate = PR_CURR;

    s_mode_trap_return((trapframe_t *) proctab[next].prstkptr);
    __builtin_unreachable();
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
