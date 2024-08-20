    # Name:        Rutwik S
    # Roll Number: 23bcs112
    # Date:        2024-08-12
.data
sideLength: .word   32

.text
            .globl  main
main:
    la      $t0,    sideLength
    lw      $t0,    0($t0)
    mult    $t0,    $t0
    mflo    $a0

    addi    $v0,    $0,         1
    syscall
    addi    $v0,    $0,         10
    syscall