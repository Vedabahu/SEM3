    # Name:        Rutwik S
    # Roll Number: 23bcs112
    # Date:        2024-08-12

    # Addition of two numbers 3 and 4 and save the values in a register and exit the program
.data
n:  .word   3
m:  .word   4

.text
main:
    la      $t4,    n
    la      $t5,    m
    lw      $t0,    0($t4)
    lw      $t1,    0($t5)
    add     $a0,    $t0,    $t1

    addi    $v0,    $0,     1
    syscall
    addi    $v0,    $0,     10
    syscall
