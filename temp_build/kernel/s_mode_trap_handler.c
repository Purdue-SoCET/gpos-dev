#include "isr.h"
#include "format.h"
#include "syscall.h"
#include "kernel.h"

void s_mode_trap_handler(trapframe_t *tf) {
  // if exception
  if ((int32_t) tf->cause >= 0) {
    switch(tf->cause) {
        case EX_INSN_PAGEFAULT:
        case EX_LOAD_PAGEFAULT:
        case EX_STORE_PAGEFAULT:
            // handle_page_fault(tf);
            break;
        case EX_ECALL_UMODE:
          tf->epc += 4;   // skip the ecall instruction
          switch (tf->gpr[17]) {   // gpr[17]= a7 = syscall number
              case SYS_EXIT:
                kill_process_kernel();
                __builtin_unreachable();
                break;

              case SYS_CREAT:
                tf->gpr[10] = create_process_kernel((void (*)(void))tf->gpr[10]);
                break;

              case SYS_YIELD:
                  reschedule();
                  __builtin_unreachable();
                  break;

              default:
                  default_handler();
                  break;
            }
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
        //context switch here via last line of reschedule();
        break;
      default:
        break;
    }
  }
  //TODO THIS ALWAYS SCHEDULES THE SAME PROCESS AGAIN
  s_mode_trap_return(tf);
  __builtin_unreachable();
}
