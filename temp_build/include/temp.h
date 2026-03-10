#include "kernel.h"
#include <stdlib.h>

typedef uint32_t pid32;

void setup_stacks(void* isr_stack, void* thread_stack);
void* get_isr_stack_ptr(pid32 pid);
void* get_thread_stack_ptr(pid32 pid);
