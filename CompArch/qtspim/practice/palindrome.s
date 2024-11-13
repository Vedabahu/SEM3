.data
str: .space 100
size: .space 0
inp0: .asciiz "Enter the string size : "
inp: .asciiz "Enter a string : "
out0: .asciiz "\nString is not a palindrome.\n"
out1: .asciiz "\nString is a palindrome.\n"

.text
.globl main
main:
	li $v0, 4
	la $a0, inp0
	syscall

	li $v0, 5
	syscall	
	addi $v0, $v0, 1 #including space for null character
	
	sw $v0, size
		
	li $v0, 4
	la $a0, inp
	syscall
	
	li $v0, 8
	la $a0, str
	lw $a1, size
	syscall

	la $a0, str
	lw $a1, size
	addi $a1, $a1, -1 # sending actual length of the string
	jal isPalindrome
	
	if_0:
		bne $v0, $0, else_0
		
		li $v0, 4
		la $a0, out0
		syscall
		
		j end_if_0
	else_0:
	
		li $v0, 4
		la $a0, out1
		syscall
	
	end_if_0:
	
	li $v0, 10
	syscall
	
isPalindrome:
	move $s0, $a0
	move $s1, $a1
	
	li $t0, 0
	addi $t1, $s1, -1
	
	while:
		bge $t0, $t1, end_while
		
		if:
			lb $t2, str($t0)
			lb $t3, str($t1)
			beq $t2, $t3, end_if
			li $v0, 0	
			jr $ra
		end_if:
		addi $t0, $t0, 1
		addi $t1, $t1, -1	
		j while
	end_while:
	
	li $v0, 1
	jr $ra
	
	
	