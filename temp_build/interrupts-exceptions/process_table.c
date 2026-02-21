
#include <stdint.h>
#include "csr.h"
#include "utility.h"
#include "format.h"

int queue[5] = {1, 2, 3, 4, 5};
int index = 0;

void set_timer(uint64_t value) {
    //*MTIMECMPH = *MTIME + valueh;
    *MTIMECMP = *MTIME + value;
}

void meip_handler() {
    print("meip handling....");
    *EXT_CLEAR = 0x1; // writing anything simulates clearing interrupt
    CSRW("mie", 0x088);
    index++;
    print("Handled. Index at %d", index);
}

void mtip_handler() {
    print("mtip handling...."); 
    //*MTIMECMP = *MTIME + 5000; // setting mtimecmp
    set_timer(5000);
    index++;
    print("Handled. Index at %d", index); 
}

void msip_handler() {
    print("msip handling....");
    *MSIP = 0x0; // writing 0 clears this
    index++;
    print("Handled. Index at %d", index);
}

int main() {
    *MTIMECMPH = 0x00;
    *MTIMECMP  = 0xFF;
    
    setup_interrupt_m_vectored(vector_table, IE_MTIE | IE_MSIE | IE_MEIE);
    enable_interrupts_m();

    *MSIP = 1;
    *EXT_SET = 1;

    while (*MTIME < 0xFF);    
	
    return 0;
}
