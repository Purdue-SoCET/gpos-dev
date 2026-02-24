
#include <stdint.h>
#include "csr.h"
#include "format.h"
#include "utility.h"

void user_main();

extern void m_mode_table(void);
extern void s_mode_table(void);

// For this test: need to subtract 0xFE from flag to make flag = 1
// Each handler should be called once. If not, flag will be wrong
void meip_handler() {
    flag -= 0xE;
    *EXT_CLEAR = 0x1; // writing anything simulates clearing interrupt
    CSRW("mie", 0x088);
}

void mtip_handler() {
    flag -= 0xE0;
    *MTIMECMPH = 0xFF; // setting mtimecmph makes a very large value
}

void msip_handler() {
    flag -= 0x10;
    *MSIP = 0x0; // writing 0 clears this
}

void s_entry(void) {
    print("s_mode entered\n");
/*
    setup_interrupt_s_vectored(s_mode_table, IE_STIE | IE_SSIE | IE_SEIE);
    setup_timer_interrupt();
    enable_interrupts_s(); */
    enter_u_mode(user_main);

    __builtin_unreachable();
}

//TODO de-facto M-mode handler, refactor later
void __attribute__((interrupt)) __attribute__((aligned(4))) exception_handler() {
    uint32_t mcause = CSRR("mcause");
    if (mcause == EX_ECALL_SMODE) {
        uint32_t fid, ext;
        asm volatile("mv %0, a6" : "=r"(fid));
        asm volatile("mv %0, a7" : "=r"(ext));

        switch (fid) {
            case 1:
                default_handler();
                break;
            case 2:
                default_handler();
                break;
            case 3:
                default_handler();
                break;
            case 4:
                default_handler();
                break;
            case 5:
                timer_handler();
                break;
            default:
                break;
        }
        advance_mepc(4);
        return;
    }
    default_handler();
}



void user_main() {
    print("u_mode entered\n");

    *MTIMECMPH = 0x00;
    *MTIMECMP  = 0xFF;


    *MSIP = 1;
    *EXT_SET = 1;

    while(*MTIME < 0xFF);

    if (flag == 1) {
        test_pass("All vectored interrupts handled");
    } else {
        test_fail("Vectored interrupts not handled correctly");
    }

    /*while(1) {
        asm volatile("wfi");
    } */

}
#define PMP_R     0x01
#define PMP_W     0x02
#define PMP_X     0x04
#define PMP_A     0x18
#define PMP_L     0x80
#define PMP_SHIFT 2

#define PMP_TOR   0x08
#define PMP_NA4   0x10
#define PMP_NAPOT 0x18

int main() {
    
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
    delegate_traps_to_s(0xFFFFFFFFu, 0xFFFFFFFFu); //hard code to delegate all delegable ints to s mode for now
    print("finished delegating traps\n");
    //this is supposed to enter m-mode from s-mode and reach the timer handler supposedly

    enter_s_mode(s_entry);
    __builtin_unreachable();
    
    /**MTIMECMPH = 0x00;
    *MTIMECMP  = 0xFF;


    *MSIP = 1;
    *EXT_SET = 1;

    while(*MTIME < 0xFF);

    if (flag == 1) {
        test_pass("All vectored interrupts handled");
    } else {
        test_fail("Vectored interrupts not handled correctly");
    } */

    return 0;
}
