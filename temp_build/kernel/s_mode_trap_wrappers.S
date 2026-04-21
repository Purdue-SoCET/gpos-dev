#define REGBYTES (4)

.section .text
.align 4
.option push
.option norvc
.globl  s_mode_trap_return
s_mode_trap_return:

  lw   t0, 32*REGBYTES(a0)
  csrw sstatus, t0

  # restore sepc 
  lw  t0,33*REGBYTES(a0)
  csrw  sepc,t0

  # switch sscratch to the current trap frame
  # just in case of a context switch
  # a0 is the first arg provided and should have trapframe
  csrw sscratch, a0

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
  sret

.global s_mode_trap_entry 
.align 4
s_mode_trap_entry:
  # atomic swap
  # sp now points to trap frame and sscratch has user's sp
  csrrw sp, sscratch, sp

  # save gprs
  sw  ra,1*REGBYTES(sp)
  sw  gp,3*REGBYTES(sp)
  sw  tp,4*REGBYTES(sp)
  sw  t0,5*REGBYTES(sp)
  sw  t1,6*REGBYTES(sp)
  sw  t2,7*REGBYTES(sp)
  sw  s0,8*REGBYTES(sp)
  sw  s1,9*REGBYTES(sp)
  sw  a0,10*REGBYTES(sp)
  sw  a1,11*REGBYTES(sp)
  sw  a2,12*REGBYTES(sp)
  sw  a3,13*REGBYTES(sp)
  sw  a4,14*REGBYTES(sp)
  sw  a5,15*REGBYTES(sp)
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
  csrr   t0,sstatus
  sw  t0,32*REGBYTES(sp)
  csrr   t0,sepc
  sw  t0,33*REGBYTES(sp)
  csrr   t0,stval
  sw  t0,34*REGBYTES(sp)
  csrr   t0,scause
  sw  t0,35*REGBYTES(sp)

  # store the user's SP into trapframe 
  csrr t0, sscratch
  sw   t0, 2*REGBYTES(sp)

  # store trapframe back into sscratch
  csrw sscratch, sp

  # the trap frame is the first argument
  move  a0, sp

  .option push
  .option norelax
  la    gp, __global_pointer$
  .option pop
  j s_mode_trap_handler 

.option pop
