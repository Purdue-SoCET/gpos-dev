#define SIZEOF_TRAPFRAME_T (4 * 36)
#define STACK_TOP (__stack_top)

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

.data
.global flag
flag: .word 0xFF
.global tohost
tohost: .word 0
.global fromhost
fromhost: .word 0
