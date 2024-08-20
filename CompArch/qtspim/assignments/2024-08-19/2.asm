    # Name:        Rutwik S
    # Roll Number: 23bcs112
    # Date:        2024-08-12
.data
sideLength1:    .word   32
sideLength2:    .word   10

.text
                .globl  main
main:
    la      $t0,    sideLength1
    la      $t1,    sideLength2
    lw      $t0,    0($t0)
    lw      $t1,    0($t1)
    mult    $t0,    $t1
    mflo    $a0

    addi    $v0,    $0,             1
    syscall
    addi    $v0,    $0,             10
    syscall