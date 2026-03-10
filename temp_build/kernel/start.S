#include "kernel.h"
#include "proc.h"

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
    # TODO: STOP HARDCODING THIS AND HACKING INTO PTRS
    # set the scratch ptrs for interrput stack 

    # t1 has SIZEOF_ISR_STACK bcz too big for 12 bits
    li   t1, SIZEOF_ISR_STACK

    # m-mode traps stacks r per-cpu usually
    sub   sp, sp, t1
    csrw  mscratch, sp

    # Allocate the isr stack for the KERNEL
    sub   sp, sp, t1
    csrw  sscratch, sp

    # set up loop. i starts at NPROC 
    # its not nPROC - 1 bcz the first one was for the kernell
    li    t0, NPROC

isr_stack_delegation:
    addi  t0, t0, -1 # decrement i by 1. break if < 0
    blt   t0, x0, isr_stack_delegation_end
    sub   sp, sp, t1
    j isr_stack_delegation

isr_stack_delegation_end:
    # start actual stack delegation
    # t1 has SIZEOF_THREAD_STACK bcz too big for 12 bits
    li   t1, SIZEOF_THREAD_STACK

    # allocate FIRST thread stack
    sub   sp, sp, t1
    mv    a1, sp    # save it as an argument

    # set up loop
    li    t0, NPROC
    addi  t0, t0, -1    # we alr did first one

thread_stack_delegation:
    addi  t0, t0, -1
    blt   t0, x0, thread_stack_delegation_end
    sub   sp, sp, t1
    j thread_stack_delegation

thread_stack_delegation_end:
    # ARGUMENT: load null process sscratch into arg
    csrr  a0, sscratch
    # a1 alr has stack thread beginnings
    call m_mode_boot

start_s_mode_boot:
    # TODO -- ALLOCATE MORE THAN TRAFRAME_T FOR ISR STACK
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

.data
.global flag
flag: .word 0xFF
.global tohost
tohost: .word 0
.global fromhost
fromhost: .word 0
