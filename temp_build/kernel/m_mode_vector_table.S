.global m_mode_table
.global s_mode_table

.align 4
.option push
.option norvc
m_mode_table:
    j m_mode_exception_handler     // exceptions jump to cause 0
    j unreachable_handler          // 1
    j unreachable_handler   // 2
    j unreachable_handler          // 3

    j unreachable_handler   // 4 
    j unreachable_handler          // 5
    j unreachable_handler   // 6
    j unreachable_handler          // 7

    j unreachable_handler   // 8
    j unreachable_handler          // 9
    j unreachable_handler   // 10
    j unreachable_handler          // 11

    j unreachable_handler   // 12
    j unreachable_handler        // 13
    j unreachable_handler   // 14
    j unreachable_handler   // 15
    // end of standard interrupts
.option pop
