    # Name:        Rutwik S
    # Roll Number: 23bcs112
    # Date:        2024-08-26

    # Calculate the area of a rectangle and exit the program.
    # (store the length and breadth of the sides of a rectangle
    # in registers and calculate the area as per the formula)

.data
length:     .word   12
breadth:    .word   10
printer:    .asciiz "Area of rectangle is : "

.text
            .globl  main
main:
    la      $a0,                length
    la      $a1,                breadth
    lw      $a0,                0($a0)
    lw      $a1,                0($a1)
    jal     areaOfRectangle
    li      $v0,                10
    syscall


areaOfRectangle:
    mul     $t0,                $a0,        $a1
    la      $a0,                printer
    li      $v0,                4
    syscall
    move    $a0,                $t0
    li      $v0,                1
    syscall
    jr      $ra
