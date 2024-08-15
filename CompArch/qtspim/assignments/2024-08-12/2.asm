    # Swap two numbers using a temporary variable and exit the program.
.data
n:  .word   12
m:  .word   13
.text
    .globl  main
main:
    la      $t0,    n
    la      $t1,    m
    lw      $t2,    0($t0)
    lw      $t3,    0($t1)
    move    $t4,    $t2
    move    $t2,    $t3
    move    $t3,    $t4

    add     $v0,    $0,     10
    syscall