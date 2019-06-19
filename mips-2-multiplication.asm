.data
string1: .asciiz "Enter a number:"
string2: .asciiz "Result(low part):"
string3: .asciiz "Result(high part):"
endLine: .asciiz "\n"

.text
main:

	li $v0, 4                   #print string 
	la $a0, string1
	syscall
	
	li $v0, 5                   #read integer
	syscall
	move $t0, $v0
		
	li $v0, 4
	la $a0, string1
	syscall
	
	li $v0, 5	
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, string2
	syscall
	
	mult $t0, $t1
	mflo $a0
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, endLine
	syscall
	
	li $v0, 4
	la $a0, string3
	syscall
	
	mfhi $a0
	li $v0, 1
	syscall
	
		
	li $v0, 10
	syscall
	
	

