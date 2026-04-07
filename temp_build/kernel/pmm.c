#define BITMAP_SIZE (DRAM_SIZE / PGSIZE / 32)

// linker says DRAM_SIZE (RAM_SIZE)
uint32_t pmm_bitmap[BITMAP_SIZE]; 

// expected to run in m-mode while phys addressing is still on
void pmm_init() {
  // initialize pmm to all 0; all are free
  memset(pmm_bitmap, 0, BITMAP_SIZE);

  // block the physical pages that are kernel mem
  // divide by PGSIZE bcz then u get the pa -> page 'index' 
  uint32_t pa_protect_start = (uint32_t) _kernel_start; 
  uint32_t pa_protect_end = (uint32_t) _kernel_end;
  uint32_t page_protect_start = 
            ((pa_protect_start + PGSIZE - 1) / PGSIZE) -
            (DRAM_BASE / PGSIZE);
  uint32_t page_protect_end = 
            ((pa_protect_end + PGSIZE - 1) / PGSIZE) - 
            (DRAM_BASE / PGSIZE);

  for (uint32_t page_protect_curr = pa_protect_start;
       page_protect_curr <= page_protect_end; page_protect_curr++) {
    uint32_t ind = page_protect_curr / 32;
    uint32_t bit = page_protect_curr % 32;
    pmm_bitmap[ind] |= (1 << bit);
  }
}

uint32_t pmm_alloc_page() {
}
