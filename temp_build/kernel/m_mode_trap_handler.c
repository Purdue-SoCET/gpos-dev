#include "isr.h"
#include "format.h"

void m_mode_trap_handler(trapframe_t *tf) {
  // if exception
  if ((int32_t) tf->cause >= 0) {
    switch(tf->cause) {
        default:
            default_handler();
            break;
    }
  } else {
    // interrupt
    uint32_t masked_cause = tf->cause;
    masked_cause <<= 1; masked_cause >>= 1;
    switch (masked_cause) {
      default:
        default_handler();
        break;
    }
  }
  m_mode_trap_return(tf);
  __builtin_unreachable();
}
