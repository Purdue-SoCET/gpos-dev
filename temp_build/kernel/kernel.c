
#include <stdint.h>
#include "csr.h"
#include "isr.h"
#include "format.h"
#include "ll_layer.h"
#include "sbi.h"
#include "kernel.h"

void s_mode_boot(void) {
    print("s_mode entered\n");

    setup_interrupt_s_vectored(s_mode_table, IE_STIE | IE_SSIE | IE_SEIE);
    
    sbi_write_timer_static(1, 2);
    enable_interrupts_s();
    return;
}

void m_mode_boot() {
    
    //kernel boot stuff later will get separated into kernel main or whatever
    setup_interrupt_m_vectored(m_mode_table, IE_MTIE | IE_MSIE | IE_MEIE); //
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
    delegate_traps_to_s(~(1 << 9), 0xFFFFFFFFu); //hard code to delegate all delegable ints to s mode for now
    print("finished delegating traps\n");
    //this is supposed to enter m-mode from s-mode and reach the timer handler supposedly
    return;
}
