    # Name:        Rutwik S
    # Roll Number: 23bcs112
    # Date:        2024-08-26

    # Fibonacci Series. Input: user provided command line argument, a random
    # positive integer, say n. Calculate the nth, and the next number in the Fibonacci
    # sequence using (a) loops, (b) recursion. The two outputs should be in registers
    # $v0, and $v1.

.data
num:        .space  4
inpStr:     .asciiz "Enter number : "
outStr1:    .asciiz "Fibinacci using loops : "
outStr2:    .asciiz "Fibinacci using recursion : "
newLine:    .asciiz "\n"

.text
            .globl  main
main:
    la      $a0,                inpStr
    li      $v0,                4
    syscall
    li      $v0,                5
    syscall
    la      $t0,                num
    sw      $v0,                0($t0)                      # number in num

    move    $a0,                $v0                         # a0 also has num
    jal     fibUsingLoop

    la      $t0,                num
    lw      $a0,                0($t0)
    jal     fibUsingRecursion
    move    $t0,                $v0
    la      $a0,                outStr2
    li      $v0,                4
    syscall
    move    $a0,                $t0
    li      $v0,                1
    syscall
    li      $v0,                10
    syscall


fibUsingLoop:
    # Using loops
    li      $t0,                0                           # t0=0
    li      $t1,                1                           # t1=1
    add     $t3,                $a0,        -2              # t3=n-2 so that setting of 0, 1 gets compensated
    add     $t4,                $t0,        $t1             # t4=nextTerm
    li      $t5,                0                           # t5=count

whileloop:
    slt     $t6,                $t5,        $t3             # t6=(t5<t3) ? 1 : 0 => t6=(count<n+1) ? 1 : 0
    beq     $t6,                $0,         endLoopFunc

    move    $t0,                $t1
    move    $t1,                $t4
    add     $t4,                $t0,        $t1


    addi    $t5,                $t5,        1
    j       whileloop


endLoopFunc:
    # print and return
    la      $a0,                outStr1
    li      $v0,                4
    syscall
    move    $a0,                $t4
    li      $v0,                1
    syscall
    la      $a0,                newLine
    li      $v0,                4
    syscall
    jr      $ra

fibUsingRecursion:
    # Using recursion
    addi    $sp,                $sp,        -12
    sw      $ra,                8($sp)
    sw      $s0,                4($sp)
    sw      $s1,                0($sp)
    move    $s0,                $a0
    li      $v0,                1
    ble     $s0,                0x2,        fibonacciExit
    addi    $a0,                $s0,        -1
    jal     fibUsingRecursion
    move    $s1,                $v0
    addi    $a0,                $s0,        -2
    jal     fibUsingRecursion
    add     $v0,                $s1,        $v0
fibonacciExit:
    lw      $ra,                8($sp)
    lw      $s0,                4($sp)
    lw      $s1,                0($sp)
    addi    $sp,                $sp,        12
    jr      $ra

