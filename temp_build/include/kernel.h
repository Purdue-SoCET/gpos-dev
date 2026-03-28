#ifndef __KERNEL_H__
#define __KERNEL_H__

#define PMP_R     0x01
#define PMP_W     0x02
#define PMP_X     0x04
#define PMP_A     0x18
#define PMP_L     0x80
#define PMP_SHIFT 2

#define PMP_TOR   0x08
#define PMP_NA4   0x10
#define PMP_NAPOT 0x18

/* ISRs */
#define QUANTUM (8)
#define CLK_TICK ((uint64_t) 50)

#define SIZEOF_ISR_STACK 4096
#define SIZEOF_THREAD_STACK 4096

/* TODO: this is the time the kernel waits to fire
 * the first clock interrupt so it has time to jump to
 * u-mode. Stop hard-coding this. */
#define WAIT_INIT ((uint64_t) 2000) 

#ifndef __ASSEMBLER__
#include <stdint.h>
#include <isr.h>
#include <proc.h>

extern void main(void);
extern void m_mode_table(void);
extern void s_mode_table(void);
extern void done(void);
extern volatile int flag;

void reschedule(void);

extern pid32 ready_queue[NPROC];
extern int index ;
extern uint64_t volatile time_remaining;
extern pid32 currpid;

#endif
#endif
