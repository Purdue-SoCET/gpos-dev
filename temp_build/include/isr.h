#ifndef _ISR_H_
#define _ISR_H_

#include "csr.h"
#include <stdint.h>
#include <stdbool.h>
#include <stdnoreturn.h>

typedef struct {
    uint32_t epc;
    uint32_t tval;
    uint32_t cause;
    uint32_t cycle;
    uint32_t time;
    uint32_t icache_misses;
    uint32_t dcache_misses;
} exception_context_t;

// Interrupt functions
noreturn void unreachable_handler();

void read_exception_context(exception_context_t *);
void read_exception_context_s(exception_context_t*);
void print_exception_context(exception_context_t *);

void advance_mepc(uint32_t by);
void set_mepc(void *address);
void advance_sepc(uint32_t by);
void set_sepc(void *address);
void setup_interrupts_m(void *handler_addr, uint32_t mie_value);
void setup_interrupt_m_vectored(void *table_addr, uint32_t mie_value);

void enable_interrupts_m();
void disable_interrupts_m();
void enable_interrupts_save_m(uint32_t restore);
uint32_t disable_interrupts_save_m();

void setup_interrupts_s(void *handler_addr, uint32_t sie_value);
void setup_interrupt_s_vectored(void *table_addr, uint32_t sie_value);

void enable_interrupts_s();
void disable_interrupts_s();
void enable_interupts_save_s(uint32_t restore);
uint32_t disable_interrupts_save_s();
void delegate_traps_to_s(uint32_t medeleg_mask, uint32_t mideleg_mask);

bool check_supervisor_mode_available();
void require_supervisor_mode();

#endif
