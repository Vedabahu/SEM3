    # Name:        Rutwik S
    # Roll Number: 23bcs112
    # Date:        2024-08-12
.data
n1:         .word   1
n2:         .word   12
n3:         .word   13
n4:         .word   14
n5:         .word   15
n6:         .word   16
even:       .asciiz "Even Number: "
newLine:    .asciiz "\n"
odd:        .asciiz "Odd Number : "
comma:      .asciiz ", "
average:    .asciiz "Average : "


.text
            .globl  main
main:
    la      $t0,    n1
    la      $t1,    n2
    la      $t2,    n3
    la      $t3,    n4
    la      $t4,    n5
    la      $t5,    n6

    lw      $t0,    0($t0)
    lw      $t1,    0($t1)
    lw      $t2,    0($t2)
    lw      $t3,    0($t3)
    lw      $t4,    0($t4)
    lw      $t5,    0($t5)


    la      $a0,    even
    addi    $v0,    $0,         4
    syscall

    # Average
    add     $t6,    $t0,        $t1
    add     $t6,    $t6,        $t2
    add     $t6,    $t6,        $t3
    add     $t6,    $t6,        $t4
    add     $t6,    $t6,        $t5
    addi    $t7,    $0,         6
    div     $t6,    $t7

    la      $a0,    average
    addi    $v0,    $0,         4
    syscall
    mflo    $a0
    addi    $v0,    $0,         1
    syscall
    la      $a0,    newLine
    addi    $v0,    $0,         4
    syscall


    # Determine even/odd
    addi    $t6,    $0,         2
    div     $t0,    $t6
    mfhi    $t7
    beq     $t7,    $0,         printEvent0

    la      $a0,    odd
    li      $v0,    4
    syscall
    move    $a0,    $t0
    li      $v0,    1
    syscall
    la      $a0,    newLine
    li      $v0,    4
    syscall
    j       event1




printEvent0:
    la      $a0,    even
    li      $v0,    4
    syscall
    move    $a0,    $t0
    li      $v0,    1
    syscall
    la      $a0,    newLine
    li      $v0,    4
    syscall

event1:

    addi    $t6,    $0,         2
    div     $t1,    $t6
    mfhi    $t7
    beq     $t7,    $0,         printEvent1

    la      $a0,    odd
    li      $v0,    4
    syscall
    move    $a0,    $t1
    li      $v0,    1
    syscall
    la      $a0,    newLine
    li      $v0,    4
    syscall
    j       event2


printEvent1:
    la      $a0,    even
    li      $v0,    4
    syscall
    move    $a0,    $t1
    li      $v0,    1
    syscall
    la      $a0,    newLine
    li      $v0,    4
    syscall

event2:

    addi    $t6,    $0,         2
    div     $t2,    $t6
    mfhi    $t7
    beq     $t7,    $0,         printEvent2

    la      $a0,    odd
    li      $v0,    4
    syscall
    move    $a0,    $t2
    li      $v0,    1
    syscall
    la      $a0,    newLine
    li      $v0,    4
    syscall
    j       event3


printEvent2:
    la      $a0,    even
    li      $v0,    4
    syscall
    move    $a0,    $t2
    li      $v0,    1
    syscall
    la      $a0,    newLine
    li      $v0,    4
    syscall

event3:

    addi    $t6,    $0,         2
    div     $t3,    $t6
    mfhi    $t7
    beq     $t7,    $0,         printEvent3

    la      $a0,    odd
    li      $v0,    4
    syscall
    move    $a0,    $t3
    li      $v0,    1
    syscall
    la      $a0,    newLine
    li      $v0,    4
    syscall
    j       event4


printEvent3:
    la      $a0,    even
    li      $v0,    4
    syscall
    move    $a0,    $t3
    li      $v0,    1
    syscall
    la      $a0,    newLine
    li      $v0,    4
    syscall

event4:

    addi    $t6,    $0,         2
    div     $t4,    $t6
    mfhi    $t7
    beq     $t7,    $0,         printEvent4

    la      $a0,    odd
    li      $v0,    4
    syscall
    move    $a0,    $t4
    li      $v0,    1
    syscall
    la      $a0,    newLine
    li      $v0,    4
    syscall
    j       event5


printEvent4:
    la      $a0,    even
    li      $v0,    4
    syscall
    move    $a0,    $t4
    li      $v0,    1
    syscall
    la      $a0,    newLine
    li      $v0,    4
    syscall


event5:

    addi    $t6,    $0,         2
    div     $t5,    $t6
    mfhi    $t7
    beq     $t7,    $0,         printEvent5

    la      $a0,    odd
    li      $v0,    4
    syscall
    move    $a0,    $t5
    li      $v0,    1
    syscall
    la      $a0,    newLine
    li      $v0,    4
    syscall
    j       end


printEvent5:
    la      $a0,    even
    li      $v0,    4
    syscall
    move    $a0,    $t5
    li      $v0,    1
    syscall
    la      $a0,    newLine
    li      $v0,    4
    syscall

end:
    li      $v0,    10
    syscall