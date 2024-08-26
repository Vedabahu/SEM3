    # Name:        Rutwik S
    # Roll Number: 23bcs112
    # Date:        2024-08-26

    # Write a program to compute the GCD and LCM of the two numbers and store the
    # result in suitable registers.

.data
n:          .word   14
m:          .word   10
GCD:        .asciiz "GCD: "
newLine:    .asciiz "\n"
LCM:        .asciiz "LCM: "

.text
            .globl  main
main:
    la      $a0,    n
    la      $a1,    m
    lw      $a0,    0($a0)
    lw      $a1,    0($a1)
    jal     gcd                             # returns gcd

    la      $a0,    n
    la      $a1,    m
    lw      $a0,    0($a0)
    lw      $a1,    0($a1)
    move    $a2,    $v0
    jal     lcm

    li      $v0,    10
    syscall

gcd:
    move    $t2,    $a0
    move    $t3,    $a1
gcdInner:
    div     $t2,    $t3
    move    $t2,    $t3
    mfhi    $t3
    bne     $t3,    $0,         gcdInner

    addi    $v0,    $0,         4
    la      $a0,    GCD
    syscall
    addi    $v0,    $0,         1
    move    $a0,    $t2                     # $t2 has gcd
    syscall
    addi    $v0,    $0,         4
    la      $a0,    newLine
    syscall
    move    $v0,    $t2
    jr      $ra

lcm:
    move    $t0,    $a0
    move    $t1,    $a1
    move    $t2,    $a2
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
    jr      $ra
