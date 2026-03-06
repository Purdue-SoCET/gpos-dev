#include "isr.h"

void s_mode_exception_handler(trapframe_t *tf) {
    switch(tf->cause) {
        case EX_INSN_PAGEFAULT:
        case EX_LOAD_PAGEFAULT:
        case EX_STORE_PAGEFAULT:
            // handle_page_fault(tf);
            break;
        default:
            default_handler();
    }
}
