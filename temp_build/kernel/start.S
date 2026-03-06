#define SIZEOF_TRAPFRAME_T (4 * 36)
#define STACK_TOP (__stack_top)
#define REGBYTES (4)

.text
.global boot
.section .text.boot
boot:
    # Zero-out regs
    li x1, 0
    li x2, 0
    li x3, 0
    li x4, 0
    li x5, 0
    li x6, 0
    li x7, 0
    li x8, 0
    li x9, 0
    li x10, 0
    li x11, 0
    li x12, 0
    li x13, 0
    li x14, 0
    li x15, 0
    li x16, 0
    li x17, 0
    li x18, 0
    li x19, 0
    li x20, 0
    li x21, 0
    li x22, 0
    li x23, 0
    li x24, 0
    li x25, 0
    li x26, 0
    li x27, 0
    li x28, 0
    li x29, 0
    li x30, 0
    li x31, 0

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
  lw  x1,1*REGBYTES(a0)
  lw  x2,2*REGBYTES(a0)
  lw  x3,3*REGBYTES(a0)
  lw  x4,4*REGBYTES(a0)
  lw  x5,5*REGBYTES(a0)
  lw  x6,6*REGBYTES(a0)
  lw  x7,7*REGBYTES(a0)
  lw  x8,8*REGBYTES(a0)
  lw  x9,9*REGBYTES(a0)
  lw  x11,11*REGBYTES(a0)
  lw  x12,12*REGBYTES(a0)
  lw  x13,13*REGBYTES(a0)
  lw  x14,14*REGBYTES(a0)
  lw  x15,15*REGBYTES(a0)
  lw  x16,16*REGBYTES(a0)
  lw  x17,17*REGBYTES(a0)
  lw  x18,18*REGBYTES(a0)
  lw  x19,19*REGBYTES(a0)
  lw  x20,20*REGBYTES(a0)
  lw  x21,21*REGBYTES(a0)
  lw  x22,22*REGBYTES(a0)
  lw  x23,23*REGBYTES(a0)
  lw  x24,24*REGBYTES(a0)
  lw  x25,25*REGBYTES(a0)
  lw  x26,26*REGBYTES(a0)
  lw  x27,27*REGBYTES(a0)
  lw  x28,28*REGBYTES(a0)
  lw  x29,29*REGBYTES(a0)
  lw  x30,30*REGBYTES(a0)
  lw  x31,31*REGBYTES(a0)
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
  sw  x1,1*REGBYTES(sp)
  sw  x3,3*REGBYTES(sp)
  sw  x4,4*REGBYTES(sp)
  sw  x5,5*REGBYTES(sp)
  sw  x6,6*REGBYTES(sp)
  sw  x7,7*REGBYTES(sp)
  sw  x8,8*REGBYTES(sp)
  sw  x9,9*REGBYTES(sp)
  sw  x10,10*REGBYTES(sp)
  sw  x11,11*REGBYTES(sp)
  sw  x12,12*REGBYTES(sp)
  sw  x13,13*REGBYTES(sp)
  sw  x14,14*REGBYTES(sp)
  sw  x15,15*REGBYTES(sp)
  sw  x16,16*REGBYTES(sp)
  sw  x17,17*REGBYTES(sp)
  sw  x18,18*REGBYTES(sp)
  sw  x19,19*REGBYTES(sp)
  sw  x20,20*REGBYTES(sp)
  sw  x21,21*REGBYTES(sp)
  sw  x22,22*REGBYTES(sp)
  sw  x23,23*REGBYTES(sp)
  sw  x24,24*REGBYTES(sp)
  sw  x25,25*REGBYTES(sp)
  sw  x26,26*REGBYTES(sp)
  sw  x27,27*REGBYTES(sp)
  sw  x28,28*REGBYTES(sp)
  sw  x29,29*REGBYTES(sp)
  sw  x30,30*REGBYTES(sp)
  sw  x31,31*REGBYTES(sp)

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
