.data
arr:        .word   1, 2, 3, 4, 5, 6, 7, 8, 9
size:       .word   9
even:       .asciiz " is even.\n"
odd:        .asciiz " is odd.\n"
average:    .asciiz "Average is : "

.text
            .globl  main
main:
    jal     even_odd_avg
    li      $v0,            10
    syscall



even_odd_avg:
    lw      $s0,            size                    # array size
    la      $s1,            arr                     # array pointer
    li      $t0,            0                       # i
    li      $t1,            0                       # sum



while:
    bge     $t0,            $s0,        end_while
    mul     $t3,            $t0,        4
    add     $t2,            $s1,        $t3         # address
    lw      $t2,            0($t2)                  # has number at a[i]
    li      $t9,            2
    div     $t2,            $t9
    mfhi    $t3                                     # remainder of a[i] % 2
if:
    bne     $t3,            $0,         else

    li      $v0,            1
    move    $a0,            $t2
    syscall
    li      $v0,            4
    la      $a0,            even
    syscall
    j       end_if

else:
    li      $v0,            1
    move    $a0,            $t2
    syscall
    li      $v0,            4
    la      $a0,            odd
    syscall

end_if:

    add     $t1,            $t1,        $t2
    addi    $t0,            $t0,        1
    j       while
end_while:
    div     $t1,            $s0
    mflo    $s2

    li      $v0,            4
    la      $a0,            average
    syscall

    li      $v0,            1
    move    $a0,            $s2
    syscall
    jr      $ra