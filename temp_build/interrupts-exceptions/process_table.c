
#include <stdint.h>
#include "csr.h"
#include "utility.h"
#include "format.h"

#define QUANTUM 2;

int queue[5] = {1, 2, 3, 4, 5};
int index = 0;
uint64_t volatile time_remaining = QUANTUM;

void reschedule_function() {
    index++;
    time_remaining = QUANTUM;
    print("Index increments. Index at %d. ", index);
}

void set_timer(uint64_t value) {
    *MTIMECMP = *MTIME + value;
}

void meip_handler() {
    print("meip handling....");
    *EXT_CLEAR = 0x1; // writing anything simulates clearing interrupt
    CSRW("mie", 0x088);
    //index++;
    print("Handled. ");
}

void mtip_handler() {
    print("mtip handling...."); 
    time_remaining -= 1;
    if (time_remaining <= 0) {	    
    	reschedule_function();
    }
    set_timer(1000);
    print("Handled. "); 
}

void msip_handler() {
    print("msip handling....");
    *MSIP = 0x0; // writing 0 clears this
    //index++;
    print("Handled. ", index);
}

int main() {
    *MTIMECMPH = 0x00;
    *MTIMECMP  = 0xFF;
    
    setup_interrupt_m_vectored(vector_table, IE_MTIE | IE_MSIE | IE_MEIE);
    enable_interrupts_m();

    *MSIP = 1;
    *EXT_SET = 1;

    while (*MTIME < 0xFFFF);    
	
    return 0;
}
