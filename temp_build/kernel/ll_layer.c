#include <stdint.h>
#include "csr.h"
#include "format.h"
#include "kernel.h"

/* LL LAYER
 *
 * These are the low-level m-mode functions invoked by the SBI
 * trap handler
 */

void ll_write_timer_static(uint32_t l, uint32_t h) {
    print("writing timer static. l is %d, h is %d\n", l, h); 
    *MTIMECMPH = h;
    *MTIMECMP = l;
}

void ll_write_timer_offset(uint32_t l, uint32_t h) {
   print("writing timer offset. l is %d, h is %d\n", l, h);
   *MTIMECMPH = *MTIME + h;
   *MTIMECMP = *MTIME + l; 
}
