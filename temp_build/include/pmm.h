#ifndef __PMM_H__
#define __PMM_H__

#define DRAM_SIZE 4194304
#define BITMAP_SIZE (DRAM_SIZE / PGSIZE / 32)

// linker stuff
extern char _kernel_start[];
extern char _kernel_end[];

extern void pmm_init();
extern uint32_t pmm_alloc_page();
extern void pmm_free_page(uint32_t pa);

#endif
