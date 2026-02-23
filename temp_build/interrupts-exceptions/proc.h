/* proc.h */

#ifndef _PROC_H_
#define _PROC_H_

#define NPROC 64   /* max number of processes */

/* Process states */
#define PR_FREE   0
#define PR_READY  1
#define PR_CURR   2
#define PR_SLEEP  3

struct procent {
    uint16  prstate;
    pri16   prprio; //process priority
    char    *prstkptr; //stack pointer
    char    *prstkbase; //base of runtime stack
    uint32  prstklen; //stack length in bytes
    //char    prname[PNMLEN] //process name
    sid32   prsem; //semaphore for process
    pid32   prparent; //ID of creating process
    //umsg    prmsg; //message sent to this process
    //bool8   prhasmsg; //Nonzero iff msg is valid
    //int16   prdesc[NDESC]; //device descriptors for process
};

extern struct procent proctab[NPROC];

#endif
