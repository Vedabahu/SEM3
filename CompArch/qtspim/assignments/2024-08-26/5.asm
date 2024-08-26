    # Fibonacci Series. Input: user provided command line argument, a random
    # positive integer, say n. Calculate the nth, and the next number in the Fibonacci
    # sequence using (a) loops, (b) recursion. The two outputs should be in registers
    # $v0, and $v1.

.data
num:        .space  4
inpStr:     .asciiz "Enter number : "
outStr1:    .asciiz "Fibinacci using loops : "
outStr2:    .asciiz "Fibinacci using recursion : "

.text
            .globl  main
main:
    la      $a0,            inpStr
    li      $v0,            4
    syscall
    li      $v0,            5
    syscall
    la      $t0,            num
    sw      $v0,            0($t0)                  # number in num

    move    $a0,            $v0                     # a0 also has num
    jal     fibUsingLoop
    li      $v0,            10
    syscall


fibUsingLoop:
    # Using loops
    li      $t0,            0                       # t0=0
    li      $t1,            1                       # t1=1
    add     $t3,            $a0,        -2          # t3=n-2 so that setting of 0, 1 gets compensated
    add     $t4,            $t0,        $t1         # t4=nextTerm
    li      $t5,            0                       # t5=count

whileloop:
    slt     $t6,            $t5,        $t3         # t6=(t5<t3) ? 1 : 0 => t6=(count<n+1) ? 1 : 0
    beq     $t6,            $0,         endFunc

    move    $t0,            $t1
    move    $t1,            $t4
    add     $t4,            $t0,        $t1


    addi    $t5,            $t5,        1
    j       whileloop


endFunc:
    # print and return
    la      $a0,            outStr1
    li      $v0,            4
    syscall
    move    $a0,            $t4
    li      $v0,            1
    syscall
    jr      $ra









