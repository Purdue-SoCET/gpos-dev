#include "isr.h"
#include "format.h"

__attribute__((noreturn)) 
void s_mode_trap_handler(trapframe_t *tf) {
  // if exception
  if ((int32_t) tf->cause >= 0) {
    switch(tf->cause) {
        case EX_INSN_PAGEFAULT:
        case EX_LOAD_PAGEFAULT:
        case EX_STORE_PAGEFAULT:
            // handle_page_fault(tf);
            break;
        default:
            default_handler();
            break;
    }
  } else {
    // interrupt
    uint32_t masked_cause = tf->cause;
    masked_cause <<= 1; masked_cause >>= 1;
    switch (masked_cause) {
      case 5:
        clk_handler();
      default:
        break;
    }
  }
  s_mode_trap_return(tf);
  __builtin_unreachable();
}
