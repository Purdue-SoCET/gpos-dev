#include "vm.h"
#include "csr.h"
#include "str_ops.h"
#include "isr.h"
#include "pmm.h"

pte_t l1pt[PTES_PER_PT] __attribute__((aligned(PGSIZE)));

// vpn: l1 index 
// returns a pointer to l2 page table from the pmm
static pte_t* get_or_alloc_l2(uint32_t vpn1) {
    if (!(l1pt[vpn1] & PTE_V)) {
        // No L2 table for this megapage yet — allocate one
        uint32_t l2_pa = pmm_alloc_page();
        assert(l2_pa != 0);
        memset(pa2kva(l2_pa), 0, PGSIZE);  // zero it so all PTEs start invalid
        l1pt[vpn1] = (l2_pa / RISCV_PGSIZE << PTE_PPN_SHIFT) | PTE_V;
        asm volatile ("sfence.vma" ::: "memory");  // global flush after L1 change
    }
    // Extract PA of L2 table from the L1 entry and convert to KVA
    return (pte_t*)pa2kva((l1pt[vpn1] >> PTE_PPN_SHIFT) * RISCV_PGSIZE);
}

static void evict(unsigned long addr)
{
  addr = addr/PGSIZE*PGSIZE;

  uint32_t vpn1 = addr / MEGAPAGE_SIZE;
  uint32_t vpn0 = (addr % MEGAPAGE_SIZE) / PGSIZE;

  // if no l2 table exists, no evicting needed
  if (!(l1pt[vpn1] & PTE_V)) return; 

  pte_t *l2 = (pte_t*) pa2kva((l1pt[vpn1] >> PTE_PPN_SHIFT) * RISCV_PGSIZE);
  pte_t *pte_ptr = &l2[vpn0];

  // if page isnt mapped, it doesnt mater
  if (!(*pte_ptr & PTE_V)) return; 

  assert(*pte_ptr & PTE_A);

  uintptr_t sstatus = CSRRS("sstatus", SSTATUS_U_ACCESS);
  if (memcmp((void*)addr, uva2kva(addr), PGSIZE)) {
    assert(*pte_ptr & PTE_D);
    memcpy(uva2kva(addr), (void*)addr, PGSIZE);
  }
  CSRW("sstatus", sstatus);

  // recover PA from PTE, invalidate, fre
  uint32_t pa = (*pte_ptr >> PTE_PPN_SHIFT) * RISCV_PGSIZE;
  assert(pa != 0);
  *pte_ptr = 0; 
  flush_page(addr);
  pmm_free_page(pa);
}

void handle_pagefault(uintptr_t addr, uintptr_t cause)
{
  addr = addr/PGSIZE*PGSIZE;
  assert(addr >= PGSIZE);

  // l1 index
  uint32_t vpn1 = addr / MEGAPAGE_SIZE; 
  uint32_t vpn0 = (addr % MEGAPAGE_SIZE) / PGSIZE; // l2 indx

  // guard ; only say user space can b lower half of addr space
  assert(vpn1 < PTES_PER_PT / 2);

  pte_t *l2 = get_or_alloc_l2(vpn1);
  pte_t *pte_ptr = &l2[vpn0];

  // page table already loaded
  // but A or D needs 2 b set 
  // A = accessed; D = dirty
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

  // demand alloc -- page has never been map
  // get physical frame from PMM
  uint32_t pa = pmm_alloc_page();
  assert(pa != 0);  // O means out of memory 

  uintptr_t new_pte = (pa >> PGSHIFT << PTE_PPN_SHIFT) | PTE_V | PTE_U | PTE_R | PTE_W | PTE_X;

  // install mapping so user VA is accessible under SUM 
  // bcz if PTE_A or PTE_D is missing and the HW tries to access, it raises a fault
  *pte_ptr = new_pte | PTE_A | PTE_D;
  flush_page(addr);

  uintptr_t sstatus = CSRRS("sstatus", SSTATUS_U_ACCESS);
  memcpy((void*)addr, uva2kva(addr), PGSIZE);
  CSRW("sstatus", sstatus);
  
  // reinstall w/o A+D so future accesses go thru soft update
  *pte_ptr = new_pte;
  flush_page(addr);

  asm volatile ("fence.i");
}

void vm_boot()
{
  _Static_assert(SIZEOF_TRAPFRAME_T == sizeof(trapframe_t), "???");

#if (MAX_TEST_PAGES > PTES_PER_PT) || (DRAM_BASE % MEGAPAGE_SIZE) != 0
# error
#endif

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
