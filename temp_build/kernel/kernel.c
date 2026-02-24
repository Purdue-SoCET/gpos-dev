
#include <stdint.h>
#include "csr.h"
#include "isr.h"
#include "format.h"
#include "utility.h"
#include "ll_layer.h"
#include "sbi.h"

#define PMP_R     0x01
#define PMP_W     0x02
#define PMP_X     0x04
#define PMP_A     0x18
#define PMP_L     0x80
#define PMP_SHIFT 2

#define PMP_TOR   0x08
#define PMP_NA4   0x10
#define PMP_NAPOT 0x18

extern void main(void);
extern void m_mode_table(void);
extern void s_mode_table(void);

noreturn void enter_s_mode(void (*s_entry)(void)) { //s_mode
    // mpp should be 1 to dictate a "return" to s-mode; write to this
    CSRC("mstatus", (3 << 11)); // MPP is bits 11 and 12; clear these
    CSRS("mstatus", (1 << 11)); // previous supervisor mode is 01; set these
    print("MPP cleared and artifically set to supervisor\n");

    CSRW("mepc", (uint32_t)s_entry);
    // set where we land in S-mode
    //set_mepc((void*)s_entry);
    print("mepc set\n");

    // seturn from trap into S-mode EXECUTION HANGS HERE
    asm volatile("mret");
    __builtin_unreachable();
}

noreturn void enter_u_mode(void (*u_entry)(void)) {
    // ensure sret returns to U-mode (SPP=0)
    CSRC("sstatus", (1 << 8)); // spp is (1 << 8)
    print("SPP cleared and artifically set to supervisor\n");

    // Set user entry PC
    CSRW("sepc", (uint32_t)u_entry);

    asm volatile("sret");
    __builtin_unreachable();
}

void s_mode_boot(void) {
    print("s_mode entered\n");

    setup_interrupt_s_vectored(s_mode_table, IE_STIE | IE_SSIE | IE_SEIE);
    
    sbi_write_timer_static(1, 2);
    enable_interrupts_s();
    enter_u_mode(main);

    __builtin_unreachable();
}

int m_mode_boot() {
    
    //kernel boot stuff later will get separated into kernel main or whatever
    setup_interrupt_m_vectored(m_mode_table, IE_MTIE | IE_MSIE | IE_MEIE); //
    print("m_mode table setup complete\n");
    //CSRW("pmpaddr0", 0xFFFFFFFFu); // Top of range
    //CSRW("pmpcfg0", 0xF);          // NAPOT range (if supported) or simple TOR (0x8F)
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

    enter_s_mode(s_mode_boot);
    __builtin_unreachable();
    return 0;
}
