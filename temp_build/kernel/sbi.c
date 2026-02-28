#include <stdint.h>
#include "sbi.h"

/* THE FOLLOWING CALLING CONVENTION WILL BE USED:
 * 
 * a6: sbi function ID
 * a0-a5: parameters, if relevant
 */

void sbi_write_timer_static(uint32_t l, uint32_t h) {
    asm volatile (
        "mv a0, %0\n\t"
        "mv a1, %1\n\t"
        "li a6, %2\n\t"
        "ecall"
        :
        : "r"(l), "r"(h), "i"(SBI_W_TIMER_STATIC)
        : "a0", "a1", "a6", "memory"
    );
}

void sbi_write_timer_offset(uint32_t l, uint32_t h) {
    asm volatile (
    	"mv a0, %0\n\t"
	"mv a1, %1\n\t"
	"li a6, %2\n\t"
	"ecall"
	:
	: "r"(l), "r"(h), "i"(SBI_W_TIMER_OFFSET)
	: "a0", "a1", "a6", "memory"	
    );
}
