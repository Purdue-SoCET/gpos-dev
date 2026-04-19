#include "vm.h"
#include "csr.h"
#include "str_ops.h"
#include "isr.h"
#include "pmm.h"

pte_t l1pt[PTES_PER_PT] __attribute__((aligned(PGSIZE)));
pte_t l2pt_user[PTES_PER_PT] __attribute__((aligned(PGSIZE)));
page_mapping_t user_mapping[MAX_TEST_PAGES];

static void evict(unsigned long addr)
{
  assert(addr >= PGSIZE && addr < MAX_TEST_PAGES * PGSIZE);
  addr = addr/PGSIZE*PGSIZE;

  page_mapping_t* mapping = &user_mapping[addr/PGSIZE];
  if (mapping->pa)
  {
    // check accessed and dirty bits
    assert(l2pt_user[addr/PGSIZE] & PTE_A);
    uintptr_t sstatus = CSRRS("sstatus", SSTATUS_U_ACCESS);
    if (memcmp((void*)addr, uva2kva(addr), PGSIZE)) {
      assert(l2pt_user[addr/PGSIZE] & PTE_D);
      memcpy(uva2kva(addr), (void*)addr, PGSIZE);
    }
    CSRW("sstatus", sstatus);

    uint32_t pa = user_mapping[addr / PGSIZE].pa;
    assert(pa != 0);
    user_mapping[addr/PGSIZE].pa = 0;
    pmm_free_page(pa);
  }
}

void handle_pagefault(uintptr_t addr, uintptr_t cause)
{
  // this is hard-coded to reference l1pt[0]
  // we can add more and additional logic so it's not hard-coded
  assert(addr >= PGSIZE && addr < MAX_TEST_PAGES * PGSIZE);
  addr = addr/PGSIZE*PGSIZE;

  // page table already loaded
  pte_t* pte_ptr = &l2pt_user[addr/PGSIZE];
  if (*pte_ptr) {
    if (!(*pte_ptr & PTE_A)) {
      *pte_ptr |= PTE_A;
    } else {
      assert(!(*pte_ptr & PTE_D) && cause == EX_STORE_PAGEFAULT);
      *pte_ptr |= PTE_D;
    }
    flush_page(addr);
    return;
  }

  // get physical frame from PMM
  uint32_t pa = pmm_alloc_page();
  assert(pa != 0);  // O means out of memory 

  uintptr_t new_pte = (pa >> PGSHIFT << PTE_PPN_SHIFT) | PTE_V | PTE_U | PTE_R | PTE_W | PTE_X;

  l2pt_user[addr/PGSIZE] = new_pte | PTE_A | PTE_D;
  flush_page(addr);

  // record which PA backs thsi virtual page
  assert(user_mapping[addr/PGSIZE].pa == 0);
  user_mapping[addr/PGSIZE].pa = pa;

  uintptr_t sstatus = CSRRS("sstatus", SSTATUS_U_ACCESS);
  memcpy((void*)addr, uva2kva(addr), PGSIZE);
  CSRW("sstatus", sstatus);

  l2pt_user[addr/PGSIZE] = new_pte;
  flush_page(addr);

  asm volatile ("fence.i");
}

void vm_boot()
{
  _Static_assert(SIZEOF_TRAPFRAME_T == sizeof(trapframe_t), "???");

#if (MAX_TEST_PAGES > PTES_PER_PT) || (DRAM_BASE % MEGAPAGE_SIZE) != 0
# error
#endif

  // map user to lowermost megapage
  // hard-coded: there's only the user and kernel page tables
  l1pt[0] = ((pte_t)l2pt_user >> PGSHIFT << PTE_PPN_SHIFT) | PTE_V;
  // map kernel to uppermost megapage
  l1pt[PTES_PER_PT-1] = (DRAM_BASE/RISCV_PGSIZE << PTE_PPN_SHIFT) | PTE_V | PTE_R | PTE_W | PTE_X | PTE_A | PTE_D;
  uintptr_t vm_choice = SATP_MODE_CHOICE;
  uintptr_t satp_value = ((uintptr_t)l1pt >> PGSHIFT)
                        | (vm_choice * (SATP_MODE & ~(SATP_MODE<<1)));
  CSRW("satp", satp_value);
  if (CSRR("satp") != satp_value)
    assert(!"unsupported satp mode");
  flush_page(DRAM_BASE);
}

void* pa2kva_func(uint32_t pa) {
  return (void*) pa2kva(pa);
}
