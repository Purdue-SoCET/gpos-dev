#include <stdarg.h>

#ifndef _FORMAT_H_
#define _FORMAT_H_

void format(const char *fmt, char *buf, ...);
void print(const char *fmt, ...);
void dprint(const char *fmt, ...);

void print_k(const char *fmt, ...);


#endif
