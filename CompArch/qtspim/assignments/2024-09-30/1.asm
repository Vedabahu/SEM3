# Name:         Rutwik S
# Roll Number:  23BCS112
# Date:         30-09-2024
# Description:  Implement check_order which checks order of array as sorted and binary search.

.data
array:      .word   0, 1, 2, 3, 4, 5, 6, 7, 8, 9
size:       .word   10
element:    .word   7

not_sorted: .asciiz "Elements are not sorted.\n"
found:      .asciiz "Element is at "
not_found:  .asciiz "Element not found.\n"

.text
            .globl  main
main:
    la      $s0,            array                       # array pointer
    la      $t1,            size
    la      $t2,            element
    lw      $s1,            0($t1)                      # size
    lw      $s2,            0($t2)                      # element

    move    $a0,            $s0                         # array pointer
    move    $a1,            $s1                         # size
    jal     check_order
    move    $t3,            $v0

if_01:
    bne     $t3,            $0,         end_if_01
    la      $a0,            not_sorted
    li      $v0,            4
    syscall
    j       end
end_if_01:

    move    $a2,            $s2
    jal     binary_search
    move    $t3,            $v0

if_02:
    li      $t4,            -1
    beq     $t3,            $t4,        end_if_02
    la      $a0,            found
    li      $v0,            4
    syscall
    move    $a0,            $t3
    li      $v0,            1
    syscall
    j       end

end_if_02:
    la      $a0,            not_found
    li      $v0,            4
    syscall

end:
    li      $v0,            10
    syscall

check_order:
    # a0 = array pointer
    # a1 = size
    li      $t0,            1
    li      $t2,            4
while_01:
    bgt     $t0,            $a1,        end_while_01
    mul     $t3,            $t0,        $t2
    add     $t3,            $t3,        $a0
    lw      $t4,            0($t3)                      # x
    lw      $t5,            -4($t3)                     # y

if_03:
    bge     $t4,            $t5,        end_if_03
    li      $v0,            0
    jr      $ra
end_if_03:

    addi    $t0,            $t0,        1
    j       while_01
end_while_01:
    li      $v0,            1
    jr      $ra

binary_search:
    # a0 = array pointer
    # a1 = size
    # a2 = element to search

    li      $t0,            0                           # left
    addi    $t1,            $a1,        -1              # right

while_02:
    bgt     $t0,            $t1,        end_while_02

    add     $t2,            $t0,        $t1
    li      $t3,            2
    div     $t2,            $t3
    mflo    $t2                                         # mid

    li      $t3,            4
    mul     $t4,            $t3,        $t2
    add     $t4,            $a0,        $t4
    lw      $t3,            0($t4)                      # x = array[mid]

if_04:
    bne     $t3,            $a2,        else_if_04
    move    $v0,            $t2
    jr      $ra
else_if_04:
    bgt     $t3,            $a2,        end_if_04
    addi    $t0,            $t2,        1
    j       while_02
end_if_04:
    addi    $t1,            $t2,        -1
    j       while_02

end_while_02:
    li      $v0,            -1
    jr      $ra

