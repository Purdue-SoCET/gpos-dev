#ifndef _CSR_MACROS_H_
#define _CSR_MACROS_H_

// Read CSR
#define CSRR(csr) ({ \
    uint32_t __value; \
    __asm__ volatile("csrr %0, " csr : "=r"(__value)); \
    __value; \
})

// Write CSR
#define CSRW(csr, val) \
    __asm__ volatile("csrw " csr ", %0" : : "r"(val))

// Read and Write CSR (atomic swap)
#define CSRRW(csr, val) ({ \
    uint32_t __value; \
    __asm__ volatile("csrrw %0, " csr ", %1" : "=r"(__value) : "r"(val)); \
    __value; \
})

// Set bits in CSR
#define CSRS(csr, val) \
    __asm__ volatile("csrs " csr ", %0" : : "r"(val))

// Read and Set bits in CSR
#define CSRRS(csr, val) ({ \
    uint32_t __value; \
    __asm__ volatile("csrrs %0, " csr ", %1" : "=r"(__value) : "r"(val)); \
    __value; \
})

// Clear bits in CSR
#define CSRC(csr, val) \
    __asm__ volatile("csrc " csr ", %0" : : "r"(val))

// Read and Clear bits in CSR
#define CSRRC(csr, val) ({ \
    uint32_t __value; \
    __asm__ volatile("csrrc %0, " csr ", %1" : "=r"(__value) : "r"(val)); \
    __value; \
})

// Immediate variants (for 5-bit unsigned immediates)
#define CSRWI(csr, imm) \
    __asm__ volatile("csrwi " csr ", %0" : : "i"(imm))

#define CSRSI(csr, imm) \
    __asm__ volatile("csrsi " csr ", %0" : : "i"(imm))

#define CSRCI(csr, imm) \
    __asm__ volatile("csrci " csr ", %0" : : "i"(imm))

#define CSRRWI(csr, imm) ({ \
    uint32_t __value; \
    __asm__ volatile("csrrwi %0, " csr ", %1" : "=r"(__value) : "i"(imm)); \
    __value; \
})

#define CSRRSI(csr, imm) ({ \
    uint32_t __value; \
    __asm__ volatile("csrrsi %0, " csr ", %1" : "=r"(__value) : "i"(imm)); \
    __value; \
})

#define CSRRCI(csr, imm) ({ \
    uint32_t __value; \
    __asm__ volatile("csrrci %0, " csr ", %1" : "=r"(__value) : "i"(imm)); \
    __value; \
})

#endif
