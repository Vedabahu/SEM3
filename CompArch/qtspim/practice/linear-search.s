.data
a:              .word   1, 2, 3, 4, 5, 6, 7, 8, 9, 0
size:           .word   10
search_element: .word   100
found:          .asciiz "Element found at position : "
not_found:      .asciiz "Element not found."

.text
                .globl  main
main:
    la      $a0,            a
    lw      $a1,            size
    lw      $a2,            search_element
    jal     linear_search
    move    $t0,            $v0

    li      $t1,            -1
if_0:               bne     $t0,            $t1,            else_0
    li      $v0,            4
    la      $a0,            not_found
    syscall
    j       end_if_0
else_0:
    li      $v0,            4
    la      $a0,            found
    syscall
    li      $v0,            1
    move    $a0,            $t0
    syscall
end_if_0:

    li      $v0,            10
    syscall

linear_search:

    move    $s0,            $a0
    move    $s1,            $a1
    move    $s2,            $a2

    addi    $s1,            $s1,            -1

while:
    blt     $s1,            $0,             end_while

    li      $t0,            4
    mul     $t1,            $s1,            $t0
    add     $t0,            $t1,            $s0
    lw      $t0,            0($t0)                                  # has a[size]

if:
    bne     $t0,            $s2,            end_if
    move    $v0,            $s1
    jr      $ra
end_if:

    addi    $s1,            $s1,            -1

    j       while
end_while:

    li      $v0,            -1

    jr      $ra
