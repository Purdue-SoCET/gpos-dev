#include "format.h"

__attribute__((section(".text.user"))) void main() {
    //print("u_mode entered\n");

    volatile int j = 1; 
    while (j);
    return;
}
