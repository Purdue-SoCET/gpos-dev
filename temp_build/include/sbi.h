#include <stdint.h>

#ifndef _SBI_H_
#define _SBI_H_

#define SBI_W_TIMER_STATIC (1)
#define SBI_W_TIMER_OFFSET (2)
void sbi_write_timer_static(uint32_t, uint32_t);
void sbi_write_timer_offset(uint32_t, uint32_t);
#endif
