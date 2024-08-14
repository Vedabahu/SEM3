    # Find the sum of first n digits
.data
n:  .word   5                       # Add the first 'n' digits

.text
    .globl  main
main:
    la      $t0,    n
    lw      $t0,    0($t0)          # Has 5
    move    $a0,    $0

loop:
    add     $a0,    $t0,    $a0
    addi    $t0,    $t0,    -1      # decrement by 1
    bne     $t0,    $0,     loop

    # Output and Exit
    addi    $v0,    $0,     1
    addi    $v1,    $0,     10
    syscall
    addi    $v0,    $0,     10
    syscall
