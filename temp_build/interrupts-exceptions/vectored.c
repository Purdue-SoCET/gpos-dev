
#include <stdint.h>
#include "../../env/csr.h"
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
    setup_interrupt_s_vectored(s_mode_table, IE_STIE | IE_SSIE | IE_SEIE);
    enable_interrupts_s();
    setup_timer_interrupt();
    enter_u_mode(user_main);

    __builtin_unreachable();
}


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

int main() {
    
    //kernel boot stuff later will get separated into kernel main or whatever
    setup_interrupt_m_vectored(m_mode_table, IE_MTIE | IE_MSIE | IE_MEIE); //
    enable_interrupts_m();
    delegate_traps_to_s(0xFFFFFFFFu, 0xFFFFFFFFu); //hard code to delegate all delegable ints to s mode for now
    enter_s_mode(s_entry);
    
    enter_u_mode(user_main);
    
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
