.global vector_table
.global m_mode_table
.global s_mode_table

.align 4
.option push
.option norvc
vector_table:
    j exception_handler     // exceptions jump to cause 0
    j ssip_handler          // 1
    j unreachable_handler   // 2
    j msip_handler          // 3

    j unreachable_handler   // 4 
    j stip_handler          // 5
    j unreachable_handler   // 6
    j mtip_handler          // 7

    j unreachable_handler   // 8
    j seip_handler          // 9
    j unreachable_handler   // 10
    j meip_handler          // 11

    j unreachable_handler   // 12
    j lcofip_handler        // 13
    j unreachable_handler   // 14
    j unreachable_handler   // 15
    // end of standard interrupts
.option pop

.align 4
.option push
.option norvc
m_mode_table:
    j m_mode_exception_handler     // exceptions jump to cause 0
    j unreachable_handler          // 1
    j unreachable_handler   // 2
    j msip_handler          // 3

    j unreachable_handler   // 4 
    j unreachable_handler          // 5
    j unreachable_handler   // 6
    j mtip_handler          // 7

    j unreachable_handler   // 8
    j unreachable_handler          // 9
    j unreachable_handler   // 10
    j meip_handler          // 11

    j unreachable_handler   // 12
    j lcofip_handler        // 13
    j unreachable_handler   // 14
    j unreachable_handler   // 15
    // end of standard interrupts
.option pop

.align 4
.option push
.option norvc
s_mode_table:
    j exception_handler     // exceptions jump to cause 0
    j ssip_handler          // 1
    j unreachable_handler   // 2
    j unreachable_handler        // 3

    j unreachable_handler   // 4 
    j stip_handler          // 5
    j unreachable_handler   // 6
    j unreachable_handler          // 7

    j unreachable_handler   // 8
    j seip_handler          // 9
    j unreachable_handler   // 10
    j unreachable_handler          // 11

    j unreachable_handler   // 12
    j lcofip_handler        // 13
    j unreachable_handler   // 14
    j unreachable_handler   // 15
    // end of standard interrupts
.option pop


//TODO define m_mode_table and s_mode here, just do unreachable for everything in m and s mode
//TODO what are the .option push, norvc and pop for, do i need to replicate them?
