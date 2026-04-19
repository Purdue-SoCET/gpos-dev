#include <stdint.h>
#include <vm.h>
#include <pmm.h>

// linker says DRAM_SIZE (RAM_SIZE)
uint32_t pmm_bitmap[BITMAP_SIZE];

static void pmm_mark_used(uint32_t ind) {
  pmm_bitmap[ind / 32] |= (1 << (ind % 32));
}


void pmm_init() {
    //Identify the range to protect (relative to DRAM_BASE)
    uintptr_t pa_start = (uintptr_t)_kernel_start;
    uintptr_t pa_end   = (uintptr_t)_kernel_end;

    // Convert PAs to 0-indexed page numbers
    // We don't round up start because we want to protect the WHOLE page it starts in
    uint32_t first_page = (pa_start - DRAM_BASE) / PGSIZE;
    // We round up end to ensure the last partial page is protected
    uint32_t last_page  = (pa_end - DRAM_BASE + PGSIZE - 1) / PGSIZE;

    // 3. Mark the range in the bitmap
    // Use the page index 'p', not the physical address
    for (uint32_t p = first_page; p <= last_page; p++) {
        uint32_t idx = p / 32;
        uint32_t bit = p % 32;
        pmm_bitmap[idx] |= (1 << bit);
    }
}

uint32_t pmm_alloc_page() {
  // return kva of the page to alloc
  
  for (int i = 0; i < BITMAP_SIZE; i++) {
    // Optimization: skip if all 32 pages in this chunk are full
    if (pmm_bitmap[i] == 0xFFFFFFFF) continue;

    for (int bit = 0; bit < 32; bit++) {
      if (!(pmm_bitmap[i] & (1 << bit))) {
        // Found a free page
        pmm_bitmap[i] |= (1 << bit);
                
        uint32_t page_idx = (i * 32) + bit;
        // Map index back to physical address
        return DRAM_BASE + (page_idx * PGSIZE);
      }
    }
  }
  
  return 0; // out of mem
}

void pmm_free_page(uint32_t pa) {
    // Validate the address is in DRAM range
    assert(pa >= DRAM_BASE && pa < DRAM_BASE + DRAM_SIZE);
    assert((pa & (PGSIZE - 1)) == 0); // must be page-aligned

    uint32_t page_idx = (pa - DRAM_BASE) / PGSIZE;
    uint32_t idx = page_idx / 32;
    uint32_t bit = page_idx % 32;

    // Double-free check
    assert(pmm_bitmap[idx] & (1 << bit));

    pmm_bitmap[idx] &= ~(1u << bit);
}
