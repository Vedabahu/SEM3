    # Name:        Rutwik S
    # Roll Number: 23bcs112
    # Date:        2024-08-26

    # Write a program to check whether an entered string is palindrome or not.
.data
str1:                   .asciiz "madam"
size:                   .word   5
isPalindromeString:     .asciiz "String is a palindrome."
isNotPalindromeString:  .asciiz "String is not a palindrome."

.text
                        .globl  main
main:
    la      $a0,        str1
    jal     palindrome
    li      $v0,        10
    syscall

palindrome:
    # $a0: String address
    # $a1: string size
    # Returns none
    li      $t0,        0
    la      $t1,        size
    lw      $t1,        0($t1)
    addi    $t1,        $t1,                    -1
loop:
    slt     $t4,        $t0,                    $t1
    beq     $t4,        $0,                     isPalindrome

    add     $t5,        $a0,                    $t0
    add     $t6,        $a0,                    $t1
    lbu     $t2,        0($t5)
    lbu     $t3,        0($t6)
    bne     $t2,        $t3,                    isNotPalindrome
    addi    $t0,        $t0,                    1
    addi    $t1,        $t1,                    -1
    j       loop

isPalindrome:
    la      $a0,        isPalindromeString
    li      $v0,        4
    syscall
    jr      $ra

isNotPalindrome:
    la      $a0,        isNotPalindromeString
    li      $v0,        4
    syscall
    jr      $ra



