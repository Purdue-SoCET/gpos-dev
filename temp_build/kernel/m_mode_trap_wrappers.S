#include "sbi_macros.h"
#define REGBYTES (4)

.align 4
.option push
.option norvc
.global m_mode_trap_entry
m_mode_trap_entry:
  # atomic swap
  # sp now points to trap frame and scratch has user's sp
  csrrw sp, mscratch, sp

  # save the registers we use, but not all -- for optimization
  sw ra,1*REGBYTES(sp)
  sw t0,5*REGBYTES(sp)
  sw t1,6*REGBYTES(sp)
  sw t2,7*REGBYTES(sp)
  # skip a0 for opensbi
  sw  a1,11*REGBYTES(sp)
  sw  a2,12*REGBYTES(sp)
  sw  a3,13*REGBYTES(sp)
  sw  a4,14*REGBYTES(sp)
  sw  a5,15*REGBYTES(sp)
  sw  a6,16*REGBYTES(sp)
  sw  a7,17*REGBYTES(sp)

  # store user's SP into trapframe
  csrr t0, mscratch
  sw t0, 2*REGBYTES(sp)

  # store trapframe back into mscratch 
  csrw mscratch, sp

m_mode_sbi_waypoint:
  # check cause of exception
  # TODO: have mcause contants
  csrr t0, mcause
  li t1, 9
  bne t0, t1, n_sbi_trap_handler

sbi_ll_exception_handler:
sbi_case_1:
  li t1, SBI_W_TIMER_STATIC
  bne a6, t1, sbi_case_2
  call ll_write_timer_static
  j sbi_handler_end

sbi_case_2:
  li t1, SBI_W_TIMER_OFFSET
  bne a6, t1, sbi_case_3
  call ll_write_timer_offset
  j sbi_handler_end

sbi_case_3:
  /* no op */
  j sbi_handler_end

sbi_handler_end:
  # advance mepc 
  csrr t0, mepc
  addi t0, t0, 4
  csrw mepc, t0

  # don't need to handle mscratch
  # we won't be context switching in m-mode.
  # thus, mscratch is fixed

  # restore used registers
  # EXCEPT FOR A0
  lw ra,1*REGBYTES(sp)
  lw t1,6*REGBYTES(sp)
  lw t2,7*REGBYTES(sp)
  # skip a0 for opensbi
  lw  a1,11*REGBYTES(sp)
  lw  a2,12*REGBYTES(sp)
  lw  a3,13*REGBYTES(sp)
  lw  a4,14*REGBYTES(sp)
  lw  a5,15*REGBYTES(sp)
  lw  a6,16*REGBYTES(sp)
  lw  a7,17*REGBYTES(sp)

  # restore stack pointer
  lw  sp,2*REGBYTES(sp)

  # mret 
  mret

n_sbi_trap_handler:
  # save everythign else we skipped over for optimizaiton
  sw  gp,3*REGBYTES(sp)
  sw  tp,4*REGBYTES(sp)
  sw  s0,8*REGBYTES(sp)
  sw  s1,9*REGBYTES(sp)
  sw  a0,10*REGBYTES(sp)
  sw  a6,16*REGBYTES(sp)
  sw  a7,17*REGBYTES(sp)
  sw  s2,18*REGBYTES(sp)
  sw  s3,19*REGBYTES(sp)
  sw  s4,20*REGBYTES(sp)
  sw  s5,21*REGBYTES(sp)
  sw  s6,22*REGBYTES(sp)
  sw  s7,23*REGBYTES(sp)
  sw  s8,24*REGBYTES(sp)
  sw  s9,25*REGBYTES(sp)
  sw  s10,26*REGBYTES(sp)
  sw  s11,27*REGBYTES(sp)
  sw  t3,28*REGBYTES(sp)
  sw  t4,29*REGBYTES(sp)
  sw  t5,30*REGBYTES(sp)
  sw  t6,31*REGBYTES(sp)

  # get sr, epc, badvaddr, cause
  csrr   t0,mstatus
  sw  t0,32*REGBYTES(sp)
  csrr   t0,mepc
  sw  t0,33*REGBYTES(sp)
  csrr   t0,mtval
  sw  t0,34*REGBYTES(sp)
  csrr   t0,mcause
  sw  t0,35*REGBYTES(sp)

  # the trap frame is the first argument
  move  a0, sp

  j m_mode_trap_handler 

.globl  m_mode_trap_return
.align 4
m_mode_trap_return:
  # restore mepc 
  lw  t0,33*REGBYTES(a0)
  csrw  mepc,t0

  # we don't need to restore mscratch
  # it doesn't change; no context switchign

  # restore gprs
  lw  ra,1*REGBYTES(a0)
  lw  sp,2*REGBYTES(a0)
  lw  gp,3*REGBYTES(a0)
  lw  tp,4*REGBYTES(a0)
  lw  t0,5*REGBYTES(a0)
  lw  t1,6*REGBYTES(a0)
  lw  t2,7*REGBYTES(a0)
  lw  s0,8*REGBYTES(a0)
  lw  s1,9*REGBYTES(a0)
  lw  a1,11*REGBYTES(a0)
  lw  a2,12*REGBYTES(a0)
  lw  a3,13*REGBYTES(a0)
  lw  a4,14*REGBYTES(a0)
  lw  a5,15*REGBYTES(a0)
  lw  a6,16*REGBYTES(a0)
  lw  a7,17*REGBYTES(a0)
  lw  s2,18*REGBYTES(a0)
  lw  s3,19*REGBYTES(a0)
  lw  s4,20*REGBYTES(a0)
  lw  s5,21*REGBYTES(a0)
  lw  s6,22*REGBYTES(a0)
  lw  s7,23*REGBYTES(a0)
  lw  s8,24*REGBYTES(a0)
  lw  s9,25*REGBYTES(a0)
  lw  s10,26*REGBYTES(a0)
  lw  s11,27*REGBYTES(a0)
  lw  t3,28*REGBYTES(a0)
  lw  t4,29*REGBYTES(a0)
  lw  t5,30*REGBYTES(a0)
  lw  t6,31*REGBYTES(a0)
  lw  a0,10*REGBYTES(a0)

  # return
  mret

.option pop
