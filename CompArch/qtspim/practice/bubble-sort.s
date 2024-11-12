.data
a:          .word   1, 3, 5, 7, 9, 2, 4, 6, 8, 10
size:       .word   10

initial:    .asciiz "Unsorted array : "
final:      .asciiz "\nSorted array : "


.text
            .globl  main

main:
    la      $s0,        a                           # arr ptr
    lw      $s1,        size                        # size

    li      $v0,        4
    la      $a0,        initial
    syscall


    li      $t0,        0
for_1:
    bge     $t0,        $s1,        end_for_1

    li      $t3,        4
    mul     $t2,        $t0,        $t3
    add     $t2,        $t2,        $s0
    lw      $t1,        0($t2)                      # has a[i]

    move    $a0,        $t1
    li      $v0,        1
    syscall
    li      $a0,        32
    li      $v0,        11
    syscall

    addi    $t0,        $t0,        1

    j       for_1
end_for_1:

    la      $a0,        a
    lw      $a1,        size
    jal     bubbleSort

    li      $v0,        4
    la      $a0,        final
    syscall

    li      $t0,        0
for_2:
    bge     $t0,        $s1,        end_for_2

    li      $t3,        4
    mul     $t2,        $t0,        $t3
    add     $t2,        $t2,        $s0
    lw      $t1,        0($t2)                      # has a[i]

    move    $a0,        $t1
    li      $v0,        1
    syscall
    li      $a0,        32
    li      $v0,        11
    syscall

    addi    $t0,        $t0,        1

    j       for_2
end_for_2:

    li      $v0,        10
    syscall


bubbleSort:
    move    $s0,        $a0                         # array
    move    $s1,        $a1                         # size


    li      $t1,        0
for_000:
    bge     $t1,        $s1,        end_for_000

    li      $t2,        0
    sub     $t9,        $s1,        $t1
    add     $t9,        $t9,        -1
for_001:
    bge     $t2,        $t9,        end_for_001

    mul     $t3,        $t2,        4
    add     $t3,        $s0,        $t3
    lw      $t4,        0($t3)                      # a[j]
    lw      $t5,        4($t3)                      # a[j+1]
if:
    ble     $t4,        $t5,        end_if

    sw      $t5,        0($t3)
    sw      $t4,        4($t3)

end_if:

    addi    $t2,        $t2,        1
    j       for_001
end_for_001:

    addi    $t1,        1
    j       for_000
end_for_000:

    jr      $ra