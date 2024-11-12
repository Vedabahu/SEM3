.data
n:      .word   10
inp:    .asciiz "Enter a number : "
out:    .asciiz "Fib is : "

.text
        .globl  main
main:
    li      $v0,    4
    la      $a0,    inp
    syscall
    li      $v0,    5
    syscall

    sw      $v0,    n

    move    $a0,    $v0
    jal     fib
    move    $t0,    $v0

    li      $v0,    4
    la      $a0,    out
    syscall
    li      $v0,    1
    move    $a0,    $t0
    syscall

    li      $v0,    10
    syscall

fib:
    move    $s0,    $a0

    li      $t0,    2

if:         bge     $s0,    $t0,    end_if
    move    $v0,    $s0
    jr      $ra
end_if:

    li      $t0,    0
    li      $t1,    1
    add     $t2,    $t0,    $t1

    li      $t3,    3
for:        bgt     $t3,    $s0,    end_for

    move    $t0,    $t1
    move    $t1,    $t2
    add     $t2,    $t0,    $t1

    addi    $t3,    $t3,    1

    j       for
end_for:

    move    $v0,    $t2
    jr      $ra
