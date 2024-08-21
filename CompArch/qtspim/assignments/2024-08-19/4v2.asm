.data
n0:             .word   0
n1:             .word   1
n2:             .word   2
n3:             .word   3
n4:             .word   4
n5:             .word   5
newLineText:    .asciiz "\n"
averageText:    .asciiz "Average : "
evenNumberText: .asciiz "Evevn Number : "
oddNumberText:  .asciiz "Odd Number   : "

.text
                .globl  main
main:
    la      $a0,                n0
    lw      $a0,                0($a0)
    jal     checkEvenAndPrint
    la      $a0,                n1
    lw      $a0,                0($a0)
    jal     checkEvenAndPrint
    la      $a0,                n2
    lw      $a0,                0($a0)
    jal     checkEvenAndPrint
    la      $a0,                n3
    lw      $a0,                0($a0)
    jal     checkEvenAndPrint
    la      $a0,                n4
    lw      $a0,                0($a0)
    jal     checkEvenAndPrint
    la      $a0,                n5
    lw      $a0,                0($a0)
    jal     checkEvenAndPrint
    j       exit


checkEvenAndPrint:
    li      $t6,                2
    div     $a0,                $t6
    mfhi    $t6
    beq     $t6,                $0,             printEven

    add     $t6,                $0,             $a0         # Has number from function call
    la      $a0,                oddNumberText
    li      $v0,                4
    syscall
    add     $a0,                $0,             $t6
    li      $v0,                1
    syscall
    la      $a0,                newLineText
    li      $v0,                4
    syscall
    j       endFunc

printEven:
    add     $t6,                $0,             $a0         # Has number from function call
    la      $a0,                evenNumberText
    li      $v0,                4
    syscall
    add     $a0,                $0,             $t6
    li      $v0,                1
    syscall
    la      $a0,                newLineText
    li      $v0,                4
    syscall

endFunc:
    jr      $ra

exit:
    li      $v0,                10
    syscall