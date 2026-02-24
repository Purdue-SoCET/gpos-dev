.align 4
.option push
.option norvc
.global m_mode_exception_handler
m_mode_exception_handler:
  # save used registers
  addi sp, sp, -16
  sw ra, 0(sp)
  sw t0, 4(sp)
  sw t1, 8(sp)
  sw t2, 12(sp)

  # check cause of exception
  # TODO: have mcause contants
  csrr t0, mcause
  li t1, 9
  bne t0, t1, n_sbi_exception_handler


sbi_ll_exception_handler:
  # save the rest of the registers
  # EXCEPT FOR A0
  addi sp, sp, -48
  sw a1, 0(sp)
  sw a2, 4(sp)
  sw a3, 8(sp)
  sw a4, 12(sp)
  sw a5, 16(sp)
  sw a6, 20(sp)
  sw a7, 24(sp)

sbi_case_1:
  li t1, 1
  bne a6, t1, sbi_case_2
  call ll_write_timer_static
  j sbi_handler_end

sbi_case_2:
  # empty

sbi_handler_end:
  # advance mepc 
  csrr t0, mepc
  addi t0, t0, 4
  csrw mepc, t0

  # restore used registers
  # EXCEPT FOR A0
  lw a1, 0(sp)
  lw a2, 4(sp)
  lw a3, 8(sp)
  lw a4, 12(sp)
  lw a5, 16(sp)
  lw a6, 20(sp)
  lw a7, 24(sp)
  addi sp, sp, 48

  lw ra, 0(sp)
  lw t0, 4(sp)
  lw t1, 8(sp)
  lw t2, 12(sp)
  addi sp, sp, 16

  # mret 
  mret


n_sbi_exception_handler:
  # restore used registers
  lw ra, 0(sp)
  lw t0, 4(sp)
  lw t1, 8(sp)
  lw t2, 12(sp)
  addi sp, sp, 16

  # goto default_handler
  j default_handler 

.option pop
