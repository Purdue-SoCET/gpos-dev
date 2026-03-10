
#include <stdint.h>
#include "csr.h"
#include "isr.h"
#include "format.h"
#include "ll_layer.h"
#include "sbi.h"
#include "kernel.h"
#include "vm.h"

#define BADPID  (-1)
#define NULLSTK 4096 //sizeof page
#define NULLPROC  0

procent_t proctab[NPROC]; //init process table

static inline void init_proc_entry(pid32 pid)
{
    procent_t *p = &proctab[pid];

    p->prstate   = PR_FREE;
    p->prprio    = 0;
    p->prstkptr  = (char*)0;
    p->prstkbase = (char*)0;
    p->prstklen  = 0;
    p->prsem     = (sid32)BADPID;   //no semaphore
    p->prparent  = (pid32)BADPID;   //no parent
    // Clear saved context so stale register values don't leak in
    memset(&p->ctx, 0, sizeof(p->ctx));
}

void init_proctab(void) {
    for (pid32 pid = 0; pid < NPROC; pid++) {
        init_proc_entry(pid);
    } 
}

pid32 ready_queue[NPROC]; // init process queue

void init_queue() {
    for (int i = 0; i < NPROC; i++) {
    ready_queue[i] = BADPID;
}
}

static uint8_t nullstk[NULLSTK] __attribute__((aligned(16)));

//init nullprocess
void nullproc_init(void)
{
    procent_t *p = &proctab[NULLPROC];

    p->prstate   = PR_READY;      
    p->prprio    = 0;            
    p->prparent  = NULLPROC;      
    p->prsem     = (sid32)BADPID; // no semaphore

    p->prstkbase = (char*)nullstk;
    p->prstklen  = NULLSTK;
    p->prstkptr  = stack_top(nullstk, NULLSTK);

    /*
     * CRITICAL: seed the saved context to start at nullproc.
     * This must match your ctxsw() restore convention.
     *
     * Most common: ctx has at least {sp, ra}.
     */
    p->ctx.sp = (uint32_t)p->prstkptr;
    p->ctx.ra = (uint32_t)nullproc; //fake return address 
}


int index = 0;
pid32 currpid = 0;
volatile uint64_t time_remaining = QUANTUM;


//TODO Pop off process queue then switch trapframe pointer 

void reschedule_function(trapframe_t *tf) {
    index++;
    time_remaining = QUANTUM;
    print("Index increments. Index at %d\n", index);
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

    init_proctab(); //fills in process table with empty entries
    init_queue();
    nullproc_init(); //initialize the null process

    currpid = NULLPROC;
    proctab[NULLPROC].prstate = PR_CURR;
    

    // TODO: fake return address from trap, write entry point of 
    // nullprocess into sepc, write U mode into sstatus.spp then
    // sret.
    return;
}

void m_mode_boot() { 
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