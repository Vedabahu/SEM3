    # Write a program to sort the given numbers using the bubble sort algorithm.
.data
numbers:    .word   1, 3, 5, 7, 9, 2, 4, 6, 8, 0
message:    .asciiz "Bubble sorted numbers: "
space:      .asciiz " "

.text
            .globl  main
main:


bubbleSort:
    # a0 = address of array
    # a1 = size of array
    move    $t0,    0($a0)                          # i
    li      $t1,    0                               # j
    li      $t2,    0                               # temp
    addi    $t3,    $a1,        -1                  # t3=n-1

while1:
    bgt     $t0,    $t3,        endWhile1
    li      $t1,    0
while2:
    sub     $t4,    $t3,        $a0                 # t4=n-i-1
    bgt     $t1,    $t4,        endWhile2

    add     $t5,    $t1,        number
    lw      $t6,    0($t5)
    lw      $t7,    4($t5)
    blt     $t6,    $t7,        noswap
    sw      $t6,    4($t5)
    sw      $t7,    0($t5)
noswap:
    addi    $t1,    $t1,        1
endWhile2:
    addi    $t0,    $t0,        1
endWhile1:

    li      $t0,    0
    move    $t1,    $a1

    move    $t2,    $a0

    la      $a0,    message
    li      $v0,    4
    syscall

print:
    21
    addi    $t0,    $t0,        1
    blt     $t0,    $t1,        print



