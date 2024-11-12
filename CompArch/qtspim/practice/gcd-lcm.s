.data
input:  .asciiz "Enter two numbers:\n"
lcm:    .asciiz "\nLCM is : "
gcd:    .asciiz "\nGCD is : "

.text
        .globl  main

main:
    li      $s0,    0                           # num1
    li      $s1,    0                           # num2
    li      $s2,    0                           # gcd
    li      $s3,    0                           # lcm
    li      $s4,    0                           # remainder
    li      $s5,    0                           # numerator
    li      $s6,    0                           # denominator

    li      $v0,    4
    la      $a0,    input
    syscall

    li      $v0,    5
    syscall
    move    $s0,    $v0
    li      $v0,    5
    syscall
    move    $s1,    $v0

if_1:       blt     $s0,    $s1,    else_1
    add     $s5,    $0,     $s0
    j       next_1
else_1:
    add     $s5,    $0,     $s1
next_1:

if_2:       bgt     $s0,    $s1,    else_2
    add     $s6,    $0,     $s0
    j       next_2
else_2:
    add     $s6,    $0,     $s1
next_2:

    div     $s5,    $s6
    mfhi    $s4

while:      beq     $s4,    $0,     while_end
    add     $s5,    $s6,    $0
    add     $s6,    $s4,    $0
    div     $s5,    $s6
    mfhi    $s4
    j       while
while_end:

    move    $s2,    $s6

    mul     $t7,    $s0,    $s1
    div     $t7,    $s2
    mflo    $s3

    li      $v0,    4
    la      $a0,    gcd
    syscall
    move    $a0,    $s2
    li      $v0,    1
    syscall

    li      $v0,    4
    la      $a0,    lcm
    syscall
    move    $a0,    $s3
    li      $v0,    1
    syscall

    li      $v0,    10
    syscall

