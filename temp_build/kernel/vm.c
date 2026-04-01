#include "vm.h"
#include "csr.h"
#include "str_ops.h"
#include "isr.h"

pte_t l1pt[PTES_PER_PT] __attribute__((aligned(PGSIZE)));
pte_t l2pt_user[PTES_PER_PT] __attribute__((aligned(PGSIZE)));

freelist_t user_mapping[MAX_TEST_PAGES];
freelist_t freelist_nodes[MAX_TEST_PAGES];
freelist_t *freelist_head, *freelist_tail;

static void evict(unsigned long addr)
{
  assert(addr >= PGSIZE && addr < MAX_TEST_PAGES * PGSIZE);
  addr = addr/PGSIZE*PGSIZE;

  // TODO: do node.mapping or whatever, i don't like this readability man
  freelist_t* node = &user_mapping[addr/PGSIZE];
  if (node->addr)
  {
    // check accessed and dirty bits
    assert(l2pt_user[addr/PGSIZE] & PTE_A);
    uintptr_t sstatus = CSRRS("sstatus", SSTATUS_U_ACCESS);
    if (memcmp((void*)addr, uva2kva(addr), PGSIZE)) {
      assert(l2pt_user[addr/PGSIZE] & PTE_D);
      memcpy(uva2kva(addr), (void*)addr, PGSIZE);
    }
    CSRW("sstatus", sstatus);

    user_mapping[addr/PGSIZE].addr = 0;

    if (freelist_tail == 0)
      freelist_head = freelist_tail = node;
    else
    {
      freelist_tail->next = node;
      freelist_tail = node;
    }
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

  freelist_t* node = freelist_head;
  assert(node);
  freelist_head = node->next;
  if (freelist_head == freelist_tail)
    freelist_tail = 0;

  uintptr_t new_pte = (node->addr >> PGSHIFT << PTE_PPN_SHIFT) | PTE_V | PTE_U | PTE_R | PTE_W | PTE_X;

  l2pt_user[addr/PGSIZE] = new_pte | PTE_A | PTE_D;
  flush_page(addr);

  assert(user_mapping[addr/PGSIZE].addr == 0);
  user_mapping[addr/PGSIZE] = *node;

  uintptr_t sstatus = CSRRS("sstatus", SSTATUS_U_ACCESS);
  memcpy((void*)addr, uva2kva(addr), PGSIZE);
  CSRW("sstatus", sstatus);

  l2pt_user[addr/PGSIZE] = new_pte;
  flush_page(addr);

  asm volatile ("fence.i");
}

void vm_boot()
{
  uint64_t random = ENTROPY;

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

  // set up freelist
  random = 1 + (random % MAX_TEST_PAGES);
  freelist_head = pa2kva((void*)&freelist_nodes[0]);
  freelist_tail = pa2kva(&freelist_nodes[MAX_TEST_PAGES-1]);
  for (long i = 0; i < MAX_TEST_PAGES; i++)
  {
    freelist_nodes[i].addr = DRAM_BASE + (MAX_TEST_PAGES + random)*PGSIZE;
    freelist_nodes[i].next = pa2kva(&freelist_nodes[i+1]);
    random = LFSR_NEXT(random);
  }
  freelist_nodes[MAX_TEST_PAGES-1].next = 0;
}

void* pa2kva_func(uint32_t pa) {
  return (void*) pa2kva(pa);
}
