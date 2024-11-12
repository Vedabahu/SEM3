.data
str:        .asciiz "civic"
size:       .word   5

isPal:      .asciiz "String is a palindrome"
isNotPal:   .asciiz "String is not a palindrome"

.text
            .globl  main
main:
    la      $a0,            str
    lw      $a1,            size
    jal     isPalindrome
    move    $t0,            $v0

if_000:
    bne     $t0,            1,          else_000

    la      $a0,            isPal
    li      $v0,            4
    syscall

    j       end_if_000
else_000:

    la      $a0,            isNotPal
    li      $v0,            4
    syscall

end_if_000:

    li      $v0,            10
    syscall

isPalindrome:

if_001:
    bne     $a1,            0,          end_if_001
    li      $v0,            1
    jr      $ra
end_if_001:

    addi    $sp,            $sp,        -4
    sw      $ra,            0($sp)

    move    $a0,            $a0
    addi    $a2,            $a1,        -1
    li      $a1,            0
    jal     palHelper

    lw      $ra,            0($sp)
    addi    $sp,            $sp,        4

    jr      $ra

palHelper:
    move    $s0,            $a0
    move    $s1,            $a1
    move    $s2,            $a2

if_002:
    bne     $s2,            $s3,        end_if_002
    li      $v0,            1
    jr      $ra
end_if_002:

    add     $t0,            $s0,        $s1
    add     $t1,            $s0,        $s2
    lb      $t0,            0($t0)
    lb      $t1,            0($t1)
if_003:
    beq     $t0,            $t1,        end_if_003
    li      $v0,            0
    jr      $ra
end_if_003:

if_004:
    addi    $t0,            $s2,        1
    bge     $s1,            $t0,        end_if_004

    addi    $sp,            $sp,        -4
    sw      $ra,            0($sp)

    move    $a0,            $s0
    addi    $a1,            $s1,        1
    addi    $a2,            $s2,        -1

    jal     palHelper

    lw      $ra,            0($sp)
    addi    $sp,            $sp,        4

    jr      $ra

end_if_004:

    li      $v0,            1
    jr      $ra
