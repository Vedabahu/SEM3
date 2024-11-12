.data
side:   .word   11
output: .asciiz "Area is : "

.text
        .globl  main
main:

    la      $s0,    side
    lw      $s0,    0($s0)      # side = 11

    li      $t0,    0
    mul     $t0,    $s0,    $s0

    li      $v0,    4
    la      $a0,    output
    syscall
    move    $a0,    $t0
    li      $v0,    1
    syscall

    li      $v0,    10
    syscall
