    # Name:        Rutwik S
    # Roll Number: 23bcs112
    # Date:        2024-08-12

    # Multiplication of two numbers 50 and 60 and exit the program (observe the values of HI and LO registers).
.data
n:  .word   50
m:  .word   60

.text
    .globl  main
main:
    la      $t0,    n
    la      $t1,    m
    lw      $t2,    0($t0)
    lw      $t3,    0($t1)
    mult    $t2,    $t3
