#ifndef _STR_OPS_H_
#define _STR_OPS_H_
#include <stdint.h>

extern void* memcpy(void* dest, const void* src, uint32_t len);
extern int memcmp(const void* s1, const void* s2, uint32_t n);
extern void* memset(void* dest, int byte, uint32_t len);


#endif
