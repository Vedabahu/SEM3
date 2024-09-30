# Name:         Rutwik S
# Roll Number:  23BCS112
# Date:         30-09-2024
# Description:  Linear Search

.data
array:          .word   1, 2, 3, 4, 5, 6, 7, 8, 9
size:           .word   9
search_element: .word   4
found:          .asciiz "Found at Positon : "
not_found:      .asciiz "Element not found."

.text
                .globl  main
main:
    la      $t0,            array
    la      $t1,            size
    la      $t2,            search_element
    lw      $t1,            0($t1)
    lw      $t2,            0($t2)

    # t0 = array pointer
    # t1 = size
    # t2 = search element

    move    $a0,            $t0
    move    $a1,            $t1
    move    $a2,            $t2
    jal     linear_search
    move    $t3,            $v0                         # result

    li      $t4,            -1
    beq     $t3,            $t4,            else_01

    la      $a0,            found
    li      $v0,            4
    syscall
    move    $a0,            $t3
    li      $v0,            1
    syscall
    li      $v0,            10
    syscall

else_01:
    la      $a0,            not_found
    li      $v0,            4
    syscall
    li      $v0,            10
    syscall

linear_search:
    # a0 = array pointer
    # a1 = array size
    # a2 = search element

    li      $t0,            0
    li      $t5,            4

while:
    bge     $t0,            $a1,            while_end
    mul     $t2,            $t0,            $t5
    add     $t3,            $t2,            $a0
    lw      $t1,            0($t3)
    bne     $t1,            $a2,            end_if
    move    $v0,            $t1
    jr      $ra
end_if:
    addi    $t0,            $t0,            1
    j       while
while_end:
    li      $v0,            -1
    jr      $ra
