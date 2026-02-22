// See LICENSE for license details.

#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include <format.h>

#include "riscv_test.h"

#define SYS_write 64

# define SATP_MODE_CHOICE SATP_MODE_SV32

void trap_entry();
void pop_tf(trapframe_t*);

extern volatile uint64_t tohost;
extern volatile uint64_t fromhost;

static void do_tohost(uint64_t tohost_value)
{
  tohost = tohost_value;
  asm volatile ("fence.i" : : :);
}

#define pa2kva(pa) ((void*)(pa) - DRAM_BASE - MEGAPAGE_SIZE)
#define uva2kva(pa) ((void*)(pa) - MEGAPAGE_SIZE)

#define flush_page(addr) asm volatile ("sfence.vma %0" : : "r" (addr) : "memory")

static void terminate(int code)
{
  do_tohost(code);
  while (1);
}

void wtf()
{
  terminate(841);
}

#define stringify1(x) #x
#define stringify(x) stringify1(x)
#define assert(x) do { \
  if (x) break; \
  print("Assertion failed: " stringify(x) "\n"); \
  terminate(3); \
} while(0)

#define l1pt pt[0]
#define user_l2pt pt[1]
# define NPT 2
# define user_llpt user_l2pt
pte_t pt[NPT][PTES_PER_PT] __attribute__((aligned(PGSIZE)));

typedef struct { pte_t addr; void* next; } freelist_t;

freelist_t user_mapping[MAX_TEST_PAGES];
freelist_t freelist_nodes[MAX_TEST_PAGES];
freelist_t *freelist_head, *freelist_tail;

static void evict(unsigned long addr)
{
  assert(addr >= PGSIZE && addr < MAX_TEST_PAGES * PGSIZE);
  addr = addr/PGSIZE*PGSIZE;

  freelist_t* node = &user_mapping[addr/PGSIZE];
  if (node->addr)
  {
    // check accessed and dirty bits
    assert(user_llpt[addr/PGSIZE] & PTE_A);
    uintptr_t sstatus = set_csr(sstatus, SSTATUS_SUM);
    if (memcmp((void*)addr, uva2kva(addr), PGSIZE)) {
      assert(user_llpt[addr/PGSIZE] & PTE_D);
      memcpy(uva2kva(addr), (void*)addr, PGSIZE);
    }
    write_csr(sstatus, sstatus);

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

extern int pf_filter(uintptr_t addr, uintptr_t *pte, int *copy);
extern int trap_filter(trapframe_t *tf);

void handle_fault(uintptr_t addr, uintptr_t cause)
{
  uintptr_t filter_encodings = 0;
  int copy_page = 1;

  assert(addr >= PGSIZE && addr < MAX_TEST_PAGES * PGSIZE);
  addr = addr/PGSIZE*PGSIZE;

  if (user_llpt[addr/PGSIZE]) {
    if (!(user_llpt[addr/PGSIZE] & PTE_A)) {
      user_llpt[addr/PGSIZE] |= PTE_A;
    } else {
      assert(!(user_llpt[addr/PGSIZE] & PTE_D) && cause == CAUSE_STORE_PAGE_FAULT);
      user_llpt[addr/PGSIZE] |= PTE_D;
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

  if (pf_filter(addr, &filter_encodings, &copy_page)) {
      new_pte = (node->addr >> PGSHIFT << PTE_PPN_SHIFT) | filter_encodings;
  }

  user_llpt[addr/PGSIZE] = new_pte | PTE_A | PTE_D;
  flush_page(addr);

  assert(user_mapping[addr/PGSIZE].addr == 0);
  user_mapping[addr/PGSIZE] = *node;

  uintptr_t sstatus = set_csr(sstatus, SSTATUS_SUM);
  memcpy((void*)addr, uva2kva(addr), PGSIZE);
  write_csr(sstatus, sstatus);

  user_llpt[addr/PGSIZE] = new_pte;
  flush_page(addr);

  asm volatile ("fence.i");
}

void handle_trap(trapframe_t* tf)
{
  if (tf->cause == CAUSE_USER_ECALL)
  {
    int n = tf->gpr[10];

    terminate(n);
  }
  
  if (tf->cause == CAUSE_FETCH_PAGE_FAULT || tf->cause == CAUSE_LOAD_PAGE_FAULT || tf->cause == CAUSE_STORE_PAGE_FAULT)
    handle_fault(tf->badvaddr, tf->cause);
  else
    assert(!"unexpected exception");

  pop_tf(tf);
}

void vm_boot(uintptr_t test_addr)
{
  print("hello world\n");

  uint64_t random = ENTROPY;
  if (read_csr(mhartid) > 0) return;

  _Static_assert(SIZEOF_TRAPFRAME_T == sizeof(trapframe_t), "???");

#if (MAX_TEST_PAGES > PTES_PER_PT) || (DRAM_BASE % MEGAPAGE_SIZE) != 0
# error
#endif
  // map user to lowermost megapage
  l1pt[0] = ((pte_t)user_l2pt >> PGSHIFT << PTE_PPN_SHIFT) | PTE_V;
  // map kernel to uppermost megapage
  l1pt[PTES_PER_PT-1] = (DRAM_BASE/RISCV_PGSIZE << PTE_PPN_SHIFT) | PTE_V | PTE_R | PTE_W | PTE_X | PTE_A | PTE_D;
  uintptr_t vm_choice = SATP_MODE_CHOICE;
  uintptr_t satp_value = ((uintptr_t)l1pt >> PGSHIFT)
                        | (vm_choice * (SATP_MODE & ~(SATP_MODE<<1)));
  write_csr(satp, satp_value);
  if (read_csr(satp) != satp_value)
    assert(!"unsupported satp mode");
  flush_page(DRAM_BASE);

  // Set up PMPs if present, ignoring illegal instruction trap if not.
  uintptr_t pmpc = PMP_NAPOT | PMP_R | PMP_W | PMP_X;
  uintptr_t pmpa = ((uintptr_t)1 << (__riscv_xlen == 32 ? 31 : 53)) - 1;
  asm volatile ("la t0, 1f\n\t"
                "csrrw t0, mtvec, t0\n\t"
                "csrw pmpaddr0, %1\n\t"
                "csrw pmpcfg0, %0\n\t"
                ".align 2\n\t"
                "1: csrw mtvec, t0"
                : : "r" (pmpc), "r" (pmpa) : "t0");

  // set up supervisor trap handling
  write_csr(stvec, pa2kva(trap_entry));
  write_csr(sscratch, pa2kva(read_csr(mscratch)));
  write_csr(medeleg,
    (1 << CAUSE_USER_ECALL) |
    (1 << CAUSE_FETCH_PAGE_FAULT) |
    (1 << CAUSE_LOAD_PAGE_FAULT) |
    (1 << CAUSE_STORE_PAGE_FAULT));
  // FPU on; accelerator on; vector unit on
  write_csr(mstatus, MSTATUS_FS | MSTATUS_XS | MSTATUS_VS);
  write_csr(mie, 0);

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

  trapframe_t tf;
  memset(&tf, 0, sizeof(tf));
  tf.epc = test_addr - DRAM_BASE;
  pop_tf(&tf);
}
