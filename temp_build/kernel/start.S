#define SIZEOF_TRAPFRAME_T (4 * 36)
#define STACK_TOP (__stack_top)
#define REGBYTES (4)

.text
.global boot
.section .text.boot
boot:
    # Zero-out regs
    li ra, 0
    li sp, 0
    li gp, 0
    li tp, 0
    li t0, 0
    li t1, 0
    li t2, 0
    li s0, 0
    li s1, 0
    li a0, 0
    li a1, 0
    li a2, 0
    li a3, 0
    li a4, 0
    li a5, 0
    li a6, 0
    li a7, 0
    li s2, 0
    li s3, 0
    li s4, 0
    li s5, 0
    li s6, 0
    li s7, 0
    li s8, 0
    li s9, 0
    li s10, 0
    li s11, 0
    li t3, 0
    li t4, 0
    li t5, 0
    li t6, 0

    # Set up SP, GP
    # TODO: Multicore support
    .option push
    .option norelax
    la sp, STACK_TOP
    la gp, __global_pointer$
    .option pop

clr_bss:
    la t0, __bss_start
    la t1, __bss_end
    beq t0, t1, do_preinit_arr

clr_bss_loop:
    sb zero, 0(t0)
    addi t0, t0, 1
    ble t0, t1, clr_bss_loop

do_preinit_arr:
    la s0, __preinit_array_start
    la s1, __preinit_array_end
    beq s0, s1, do_init_arr

preinit_arr_calls:
    lw s2, 0(s0)
    jalr ra, s2
    addi s0, s0, 4
    bne s0, s1, preinit_arr_calls

do_init_arr:
    la s0, __init_array_start
    la s1, __init_array_end
    beq s0, s1, kernel_boot 

init_arr_calls:
    lw s2, 0(s0)
    jalr ra, s2
    addi s0, s0, 4
    bne s0, s1, preinit_arr_calls

kernel_boot:
start_m_mode_boot:
    # set the scratch ptr for interrput stack 
    addi sp, sp, -SIZEOF_TRAPFRAME_T
    csrw mscratch, sp
    call m_mode_boot

start_s_mode_boot:
    # switch to s-mode
    li    t0, (3 << 11)  # clear mstatus.mpp
    csrc  mstatus, t0
    li    t0, (1 << 11)  # set mstatus.mpp to be s
    csrs  mstatus, t0

    la    ra, start_main     # execute u-mode boot on ret
    la    t0, s_mode_boot    # jump to s_mode_boot
    csrw  mepc, t0
    mret

start_main:
    # switch to u-mode
    li    t0, (1 << 8)  #spp is (1 << 8)
    csrc  sstatus, t0
    
    la    ra, done      # upon main return, execute done()
    la    t0, main
    csrw  sepc, t0
    sret

.global done
done:
check_flag:
    li x28, 1
    la x27, tohost
    sw x28, 0(x27)

.global __sim_halt
__sim_halt:
    j __sim_halt

.globl  s_mode_trap_return
.align 4
s_mode_trap_return:
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

  # store the user's SP into trapframe 
  csrr t0, sscratch
  sw   t0, 2*REGBYTES(sp)

  # store trapframe back into sscratch
  csrw sscratch, sp

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

  # the trap frame is the first argument
  move  a0, sp

  j s_mode_trap_handler 

.data
.global flag
flag: .word 0xFF
.global tohost
tohost: .word 0
.global fromhost
fromhost: .word 0
