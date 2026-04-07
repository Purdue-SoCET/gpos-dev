#include <stdint.h>
#include "csr.h"
#include "format.h"
#include "ll_layer.h"

/* LL LAYER
 *
 * These are the low-level m-mode functions invoked by the SBI
 * trap handler
 */

void ll_write_timer_static(uint32_t l, uint32_t h) {
    ll_print("writing timer static\n"); 
    *MTIMECMPH = 0xFFFFFFFF;
    *MTIMECMP = l;
    *MTIMECMPH = h;
}

void ll_write_timer_offset(uint32_t l, uint32_t h) {
    ll_print("writing timer offset\n", l, h);

    uint32_t mtime_h, mtime_l;

    // pseudo-atomic read 
    do {
        mtime_h = *MTIMEH;
        mtime_l = *MTIME;
    } while (mtime_h != *MTIMEH);

    // add and handle overflows
    uint64_t cur = ((uint64_t)mtime_h << 32) | mtime_l;
    uint64_t offset = ((uint64_t)h << 32) | l;
    uint64_t new_time = cur + offset;
    
    // increment
    *MTIMECMPH = 0xFFFFFFFF;
    *MTIMECMP  = (uint32_t)(new_time);
    *MTIMECMPH = (uint32_t)(new_time >> 32);

    // print("time is currently %d. new time is %d\n", *(uint64_t*)(MTIME), new_time);
}

void ll_print(char* str) {
    // convert addr based on previous privilege
    // set MRPRV = 1 to interpret str as from previous addr
    
    // FOR NOW assumes m-mode address from str
    for (int i = 0; str[i]; i++) {
      *MAGIC = str[i];
    }
}
