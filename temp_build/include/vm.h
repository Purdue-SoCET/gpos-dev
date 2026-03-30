#ifndef _VM_H_
#define _VM_H_

#include "memory_map.h"
#include "kernel.h"

/* page table settings */
#define SATP_MODE_SV32 1
#define SATP_MODE_CHOICE SATP_MODE_SV32
#define SATP32_MODE 0x80000000
#define SATP_MODE SATP32_MODE

// we are defining max test pages as bound by the random number generator 
// due to the way we initializing the freelist mappings
#define MAX_TEST_PAGES ((1 << LFSR_BITS)-1) 

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

#define SSTATUS_U_ACCESS         0x00040000

/* page table constants */
#define PTES_PER_PT (1UL << RISCV_PGLEVEL_BITS)
#define RISCV_PGLEVEL_BITS (10) /* as per satp32 mode*/
#define PGSHIFT 12
#define PGSIZE (1UL << PGSHIFT)
#define MEGAPAGE_SIZE (PTES_PER_PT * PGSIZE)

/* page shifts */
#define PTE_PPN_SHIFT 10  /* remaining 10 bits are offset ; shift away to get page */
#define RISCV_PGSHIFT 12
#define RISCV_PGSIZE (1 << RISCV_PGSHIFT)
#define SIZEOF_TRAPFRAME_T ((32 / 8) * 36)

#ifndef __ASSEMBLER__

#include "format.h"
#include <stdint.h>


/* random engine */
#define LFSR_BITS 6   /* simulating this with a "32-bit register" */
#define LFSR_NEXT(x) (((((x)^((x)>>1)) & 1) << (LFSR_BITS-1)) | ((x) >> 1))

/* vm conversions */
#define pa2kva(pa) ((void*)(pa) - DRAM_BASE - MEGAPAGE_SIZE)
#define uva2kva(pa) ((void*)(pa) - MEGAPAGE_SIZE)

#define flush_page(addr) asm volatile ("sfence.vma %0" : : "r" (addr) : "memory")

#define stringify1(x) #x
#define stringify(x) stringify1(x)
#define assert(x) do { \
  if (x) break; \
  print("Assertion failed: " stringify(x) "\n"); \
  done(); \
} while(0)

typedef uint32_t pte_t; 

typedef struct { 
  pte_t addr; 
  void* next; 
} freelist_t;

extern pte_t l1pt[PTES_PER_PT] __attribute__((aligned(PGSIZE)));
extern pte_t l2pt_user[PTES_PER_PT] __attribute__((aligned(PGSIZE)));

extern freelist_t user_mapping[MAX_TEST_PAGES];
extern freelist_t freelist_nodes[MAX_TEST_PAGES];
extern freelist_t *freelist_head;
extern freelist_t *freelist_tail;

extern void vm_boot();
extern void handle_pagefault(uintptr_t, uintptr_t);
#endif
#endif
