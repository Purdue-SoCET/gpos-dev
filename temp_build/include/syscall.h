#ifndef SYSCALL_H
#define SYSCALL_H

typedef enum {
    //SYS_SYSCALL = 0;
    SYS_YIELD   = 0, //temporary for testing purposes
    SYS_EXIT    = 1,
    SYS_FORK    = 2,
    SYS_READ    = 3,
    SYS_WRITE   = 4,
    SYS_OPEN    = 5,
    SYS_CLOSE   = 6,
    SYS_WAIT    = 7,
    SYS_CREAT   = 8,
    SYS_LINK    = 9,
    SYS_UNLINK  = 10,
    SYS_EXEC    = 11,
    SYS_CHDIR   = 12,
    SYS_TIME    = 13,
} syscall_num_t;

#endif
