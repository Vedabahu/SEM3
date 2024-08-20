    # Name:        Rutwik S
    # Roll Number: 23bcs112
    # Date:        2024-08-12
.data
n:          .word   14
m:          .word   10
GCD:        .asciiz "GCD: "
newLine:    .asciiz "\n"
LCM:        .asciiz "LCM: "


.text
            .globl  main
main:
    la      $t0,    n
    la      $t1,    m
    lw      $t0,    0($t0)
    lw      $t1,    0($t1)
    move    $t2,    $t0             # copy $t0 to $t2
    move    $t3,    $t1             # copy $t1 to $t3


gcd:
    div     $t2,    $t3
    move    $t2,    $t3
    mfhi    $t3
    bne     $t3,    $0,         gcd

    addi    $v0,    $0,         4
    la      $a0,    GCD
    syscall
    addi    $v0,    $0,         1
    move    $a0,    $t2             # $t2 has gcd
    syscall
    addi    $v0,    $0,         4
    la      $a0,    newLine
    syscall

lcm:
    mult    $t0,    $t1
    mflo    $t3
    div     $t3,    $t2
    mflo    $t2

    addi    $v0,    $0,         4
    la      $a0,    LCM
    syscall

    move    $a0,    $t2
    addi    $v0,    $0,         1
    syscall

    addi    $v0,    $0,         10
    syscall


