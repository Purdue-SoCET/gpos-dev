#include "str_ops.h"

void* memcpy(void* dest, const void* src, uint32_t len)
{
  if ((((uintptr_t)dest | (uintptr_t)src | len) & (sizeof(uintptr_t)-1)) == 0) {
    const uintptr_t* s = src;
    uintptr_t *d = dest;
    while (d < (uintptr_t*)(dest + len))
      *d++ = *s++;
  } else {
    const char* s = src;
    char *d = dest;
    while (d < (char*)(dest + len))
      *d++ = *s++;
  }
  return dest;
}

int memcmp(const void* s1, const void* s2, uint32_t n)
{
  if ((((uintptr_t)s1 | (uintptr_t)s2) & (sizeof(uintptr_t)-1)) == 0) {
    const uintptr_t* u1 = s1;
    const uintptr_t* u2 = s2;
    const uintptr_t* end = u1 + (n / sizeof(uintptr_t));
    while (u1 < end) {
      if (*u1 != *u2)
        break;
      u1++;
      u2++;
    }
    n -= (const void*)u1 - s1;
    s1 = u1;
    s2 = u2;
  }

  while (n--) {
    unsigned char c1 = *(const unsigned char*)s1++;
    unsigned char c2 = *(const unsigned char*)s2++;
    if (c1 != c2)
      return c1 - c2;
  }

  return 0;
}

void* memset(void* dest, int byte, uint32_t len)
{
  if ((((uintptr_t)dest | len) & (sizeof(uintptr_t)-1)) == 0) {
    uintptr_t word = byte & 0xFF;
    word |= word << 8;
    word |= word << 16;
    word |= word << 16 << 16;

    uintptr_t *d = dest;
    while (d < (uintptr_t*)(dest + len))
      *d++ = word;
  } else {
    char *d = dest;
    while (d < (char*)(dest + len))
      *d++ = byte;
  }
  return dest;
}

