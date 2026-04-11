#include "format.h"
#include "kernel.h"

void dummy();

void main() {
    print("u_mode main() entered\n");
    create(dummy);
    volatile int j = 1; 
    while (j);
    return;
}

void dummy() {
    print("dummy function entered\n");
    while(1);
}
