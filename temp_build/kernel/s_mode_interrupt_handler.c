#include "isr.h"

void s_mode_interrupt_handler(trapframe_t *tf) {
    switch(tf->cause) {
        case 5: // Supervisor Timer Interrupt (STIP)
            // Note: Timer is usually cleared by writing to a clock compare register
            clk_handler();
            break;
        default:
            // Just ignore unknown interrupts rather than panicking
            default_handler();
            break;
    }
}
