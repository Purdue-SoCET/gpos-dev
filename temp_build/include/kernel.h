#include <stdint.h>
#include <proc.h>

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

extern void main(void);
extern void m_mode_table(void);
extern void s_mode_table(void);
extern void done(void);
extern volatile int flag;

void reschedule_function(void);

#define QUANTUM (8)
#define CLK_TICK ((uint64_t) 50)

/* TODO: this is the time the kernel waits to fire
 * the first clock interrupt so it has time to jump to
 * u-mode. Stop hard-coding this. */
#define WAIT_INIT ((uint64_t) 2000) 
extern pid32 ready_queue[NPROC];
extern int index ;
extern uint64_t volatile time_remaining;

#endif
