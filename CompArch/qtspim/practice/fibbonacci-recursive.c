#include <stdio.h>

int fib(int n)
{
    if (n < 2)
        return n;

    int t0 = fib(n - 1);
    int t1 = fib(n - 2);

    return t0 + t1;
}

int main()
{
    int n = 0;
    printf("Enter a number : ");
    scanf("%d", &n);

    int x = fib(n);

    printf("Fib is : %d", x);

    return 0;
}

// .data
// n: .word 10
// inp: .asciiz "Enter a number : "
// out: .asciiz "Fib is : "

// .text
// .globl main
// main:
//     li $v0, 4
//     la $a0, inp
//     syscall
//     li $v0, 5
//     syscall

//     sw $v0, n

//     move $a0, $v0
//     jal fib
//     move $t0, $v0

//     li $v0, 4
//     la $a0, out
//     syscall
//     li $v0, 1
//     move $a0, $t0
//     syscall

//     li $v0, 10
//     syscall

// fib:

//     move $s0, $a0 # has n

//     if: bge $s0, 2, end_if
//         move $v0, $a0
//         jr $ra
//     end_if:

//     subu $sp, $sp, 12

//     sw $s0, 0($sp)
//     sw $ra, 4($sp)

//     addi $a0, $s0, -1
//     jal fib
//     move $s1, $v0

//     lw $s0, 0($sp)
//     lw $ra, 4($sp)

//     sw $s0, 0($sp)
//     sw $ra, 4($sp)
//     sw $s1, 8($sp)

//     addi $a0, $s0, -2
//     jal fib
//     move $s2, $v0

//     lw $s0, 0($sp)
//     lw $ra, 4($sp)
//     lw $s1, 8($sp)

//     addi $sp, $sp, 12

//     add $v0, $s1, $s2
//     jr $ra
