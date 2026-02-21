
#include <stdint.h>
#include "csr.h"
#include "utility.h"
#include "format.h"

int queue[5] = {1, 2, 3, 4, 5};
int index = 0;

//void set_timer(int valueh, int value) {
//    *MTIMECMPH = *MTIME + valueh;
//    *MTIMECMP = *MTIME + value;
//}

// For this test: need to subtract 0xFE from flag to make flag = 1
// Each handler should be called once. If not, flag will be wrong
void meip_handler() {
    print("meip handling....");
    //flag -= 0xE;
    *EXT_CLEAR = 0x1; // writing anything simulates clearing interrupt
    CSRW("mie", 0x088);
    index++;
    print("Handled. Index at %d", index);
}

void mtip_handler() {
    print("mtip handling....");
    //flag -= 0xE0;
    //set_timer(0, 5000); 
    *MTIMECMP = *MTIME + 5000; // setting mtimecmph makes a very large value
    index++;
    print("Handled. Index at %d", index); 
}

void msip_handler() {
    print("msip handling....");
  //  flag -= 0x10;
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
	
//    if (flag == 1) {
//        test_pass("All vectored interrupts handled");
//    } else {
//        test_fail("Vectored interrupts not handled correctly");
//    }

    return 0;
}
