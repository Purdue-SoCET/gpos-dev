#include <stdint.h>
#include "csr_macros.h"
#include "format.h"

void ll_write_timer_static(uint32_t l, uint32_t h) {
    print("writing timer static. l is %d, h is %d", l, h); 
}

void ll_write_timer_offset(uint32_t l, uint32_t h) {
    print("writing timer offset. l is %d, h is %d", l, h); 
}
