.data
n:      .word   0
enter:  .asciiz "Enter a number : "
pri:    .asciiz "Sum is : "

.text
        .globl  main
main:
    li      $v0,    4
    la      $a0,    enter
    syscall
    li      $v0,    5
    syscall

    sw      $v0,    n                   # number in n

    li      $s0,    0                   # sum

    lw      $t0,    n                   # has n

while:
    ble     $t0,    $0,     end_while
    li      $t1,    10
    div     $t0,    $t1
    mfhi    $t2                         # has remainder
    add     $s0,    $s0,    $t2
    div     $t0,    $t1
    mflo    $t0
    j       while
end_while:

    li      $v0,    4
    la      $a0,    pri
    syscall
    li      $v0,    1
    move    $a0,    $s0
    syscall

    li      $v0,    10
    syscall