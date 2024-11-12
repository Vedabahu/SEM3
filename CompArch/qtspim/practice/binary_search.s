.data

a:              .word   0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
size:           .word   11
search_element: .word   7

found:          .asciiz "Element found at position : "
not_found:      .asciiz "Element not found."

.text
                .globl  main
main:
    la      $a0,            a
    lw      $a1,            size
    lw      $a2,            search_element

    jal     binray_search

    move    $s0,            $v0

    li      $t0,            -1
if_0:
    bne     $s0,            $t0,            else_0

    li      $v0,            4
    la      $a0,            not_found
    syscall

    j       end_if_0

else_0:

    li      $v0,            4
    la      $a0,            found
    syscall

    move    $a0,            $s0
    li      $v0,            1
    syscall

end_if_0:

    li      $v0,            10
    syscall

binray_search:
    li      $t0,            0
    addi    $t1,            $a1,            -1
    li      $t2,            0

while:
    bgt     $t0,            $t1,            end_while

    add     $t9,            $t0,            $t1
    li      $t8,            2
    div     $t9,            $t8
    mflo    $t2

    li      $t9,            4
    mul     $t9,            $t9,            $t2
    add     $t9,            $t9,            $a0
    lw      $t9,            0($t9)

if:
    bne     $t9,            $a2,            else_if
    move    $v0,            $t2
    jr      $ra
    j       end_if
else_if:
    bge     $a2,            $t9,            else
    addi    $t1,            $t2,            -1
    j       end_if
else:
    addi    $t0,            $t2,            1
end_if:
    j       while
end_while:

    li      $v0,            -1
    jr      $ra