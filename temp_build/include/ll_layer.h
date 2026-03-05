#include <stdint.h>

#ifndef _LL_LAYER_H_
#define _LL_LAYER_H_

/* mem linker addrs */
#define DRAM_BASE          0x80000000

/* MMIO addrs */
#define MTIME_ADDR      0xFFFFFFE0
#define MTIMEH_ADDR     0xFFFFFFE4
#define MTIMECMP_ADDR   0xFFFFFFE8
#define MTIMECMPH_ADDR  0xFFFFFFEC
#define MSIP_ADDR       0xFFFFFFF0
#define EXT_ADDR_SET    0xFFFFFFF4
#define EXT_ADDR_CLEAR  0xFFFFFFF8
#define MAGIC_ADDR      0xFFFFFFFC

#define MTIME           (volatile uint32_t *)(MTIME_ADDR)
#define MTIMEH          (volatile uint32_t *)(MTIMEH_ADDR)
#define MTIMECMP        (volatile uint32_t *)(MTIMECMP_ADDR)
#define MTIMECMPH       (volatile uint32_t *)(MTIMECMPH_ADDR)
#define MSIP            (volatile uint32_t *)(MSIP_ADDR)
#define EXT_SET         (volatile uint32_t *)(EXT_ADDR_SET)
#define EXT_CLEAR       (volatile uint32_t *)(EXT_ADDR_CLEAR)
#define MAGIC           (volatile uint32_t *)(MAGIC_ADDR)

void ll_write_timer_static(uint32_t l, uint32_t h);
void ll_write_timer_offset(uint32_t l, uint32_t h);

#endif
