#ifndef _VM_H_
#define _VM_H_

/* page table settings */
#define SATP_MODE_SV32 1
#define SATP_MODE_CHOICE SATP_MODE_SV32

// we are defining max test pages as bound by the random number generator 
// due to the way we initializing the freelist mappings
#define MAX_TEST_PAGES ((1 << LFSR_BITS)-1) 

/* random engine */
#define LFSR_BITS 6   /* simulating this with a "32-bit register" */
#define LFSR_NEXT(x) (((((x)^((x)>>1)) & 1) << (LFSR_BITS-1)) | ((x) >> 1))

/* page table entry (PTE) fields */
#define PTE_V     0x001 /* Valid */
#define PTE_R     0x002 /* Read */
#define PTE_W     0x004 /* Write */
#define PTE_X     0x008 /* Execute */
#define PTE_U     0x010 /* User */
#define PTE_G     0x020 /* Global */
#define PTE_A     0x040 /* Accessed */
#define PTE_D     0x080 /* Dirty */
#define PTE_SOFT  0x300 /* Reserved for Software */

/* page shifts */
#define PTE_PPN_SHIFT 10  /* remaining 10 bits are offset ; shift away to get page */
#define RISCV_PGSHIFT 12
#define RISCV_PGSIZE (1 << RISCV_PGSHIFT)
#define SIZEOF_TRAPFRAME_T ((32 / 8) * 36)

#endif
