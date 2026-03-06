
#include <stdint.h>
#include "csr.h"
#include "isr.h"
#include "format.h"
#include "sbi.h"
#include "kernel.h"
#include "vm.h"

int queue[5] = {1, 2, 3, 4, 5};
int index = 0;
volatile uint64_t time_remaining = QUANTUM;

void reschedule_function() {
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
