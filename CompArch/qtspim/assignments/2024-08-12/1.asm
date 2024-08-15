    # Load two 32b constants onto $t0 and $t1. Add them and store the result in $t2 and exit the program.
.data
n:  .word   12
m:  .word   14
.text
    .globl  main
main:
    la      $t0,    n
    la      $t1,    m
    lw      $t2,    0($t0)
    lw      $t3,    0($t1)
    add     $t2,    $t2,    $t3

    addi    $v0,    $0,     10
    syscall