#include <stdint.h>
#include "sbi_macros.h"

#ifndef _SBI_H_
#define _SBI_H_

void sbi_write_timer_static(uint32_t, uint32_t);
void sbi_write_timer_offset(uint32_t, uint32_t);
#endif
