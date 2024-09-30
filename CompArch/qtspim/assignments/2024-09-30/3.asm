# Name:         Rutwik S
# Roll Number:  23BCS112
# Date:         30-09-2024
# Description:  Sum of digits of a positive number

.data
prompt: .asciiz "Enter a positive number : "
nega:   .asciiz "Number is negetive."
sum_is: .asciiz "Sum is "

.text
        .globl  main
main:
    la      $a0,    prompt
    li      $v0,    4
    syscall
    li      $v0,    5
    syscall
    move    $s0,    $v0                         # s0 has number n

if:
    bgt     $s0,    $0,     end_if
    la      $a0,    nega
    li      $v0,    4
    syscall
    li      $v0,    10
    syscall

end_if:

    li      $t0,    0                           # sum
    li      $t1,    10
while:
    ble     $s0,    $0,     end_while
    div     $s0,    $t1
    mfhi    $t2                                 # has remainder
    add     $t0,    $t0,    $t2
    div     $s0,    $t1
    mflo    $s0
    j       while

end_while:

    la      $a0,    sum_is
    li      $v0,    4
    syscall
    move    $a0,    $t0
    li      $v0,    1
    syscall
    li      $v0,    10
    syscall
