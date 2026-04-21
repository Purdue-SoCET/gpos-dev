/* proc.h */

#ifndef _PROC_H_
#define _PROC_H_

#define NPROC 5   /* max number of processes */

/* Process states */
#define PR_FREE   0
#define PR_READY  1
#define PR_CURR   2
#define PR_SLEEP  3

#ifndef __ASSEMBLER__

typedef	unsigned char	byte;
typedef	unsigned char	uint8;
typedef	int		int32;
typedef	short		int16;
typedef	unsigned int	uint32;
typedef	unsigned short	uint16;
typedef	unsigned long long uint64;

typedef	int32	sid32;		/* semaphore ID				*/
typedef	int16	qid16;		/* queue ID				*/
typedef	int32	pid32;		/* process ID				*/
typedef	int32	did32;		/* device ID				*/
typedef	int16	pri16;		/* process priority			*/
typedef	uint32	umsg32;		/* message passed among processes	*/
typedef	int32	bpid32;		/* buffer pool ID			*/
typedef	byte	bool8;		/* Boolean type				*/
typedef	uint32	intmask;	/* saved interrupt mask			*/
typedef	int32	ibid32;		/* index block ID (used in file system)	*/
typedef	int32	dbid32;		/* data block ID (used in file system)	*/
typedef	int32	uid32;		/* ID for UDP table descriptor		*/


typedef struct {
    uint16  prstate;
    //pri16   prprio; //process priority
    char    *prstkptr; //stack pointer of isr stack
    //char    *prstkbase; //base of runtime stack
    //uint32  prstklen; //stack length in bytes
    //char    prname[PNMLEN] //process name
    //sid32   prsem; //semaphore for process
    //pid32   prparent; //ID of creating process
    //umsg    prmsg; //message sent to this process
    //bool8   prhasmsg; //Nonzero iff msg is valid
    //int16   prdesc[NDESC]; //device descriptors for process
} procent_t;


extern procent_t proctab[NPROC]; 

#endif
#endif

