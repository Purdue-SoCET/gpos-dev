#include "format.h"

void main() {
    print("u_mode entered\n");
    volatile int stall = 1;
    for (stall; stall < 100; stall++);

    return;
}
