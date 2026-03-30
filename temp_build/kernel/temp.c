#include "kernel.h"
#include "temp.h"
#include "proc.h"
#include <stdlib.h>

static void* isr_stack_top;
static void* thread_stack_top;

// TODO -- BUG -- VIRTUAL MEM
void setup_stacks(void* isr_stack, void* thread_stack) {
  isr_stack_top = isr_stack;
  thread_stack_top = thread_stack;
}

void* get_isr_stack_ptr(pid32 pid) {
  if (pid >= NPROC) return NULL;
  return isr_stack_top - ((pid + 1) * SIZEOF_ISR_STACK);
}

void* get_thread_stack_ptr(pid32 pid) {
  if (pid >= NPROC) return NULL;
  return thread_stack_top - ((pid + 1) * SIZEOF_THREAD_STACK);
}

