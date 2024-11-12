.data
n:      .word   55
output: .asciiz "Sum is "

.text
        .globl  main
main:
    # la      $t0,    n
    lw      $t0,    n                       # has n
    li      $t1,    0                       # int sum = 0
L1:         ble     $t0,    $0,     END_L1
    add     $t1,    $t1,    $t0
    addi    $t0,    $t0,    -1
    j       L1
END_L1:

    li      $v0,    4
    la      $a0,    output
    syscall
    li      $v0,    1
    move    $a0,    $t1
    syscall

    li      $v0,    10
    syscall

loop:
