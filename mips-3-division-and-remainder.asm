.data
string1: .asciiz "Enter a number:"
string2: .asciiz "Division:"
string3: .asciiz "Remainder:"
endLine: .asciiz "\n"

.text
main:

	li $v0, 4
	la $a0, string1
	syscall
	
	li $v0, 5
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
	
	div $a0,$t0,$t1  #   a0 = t0 / t1
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, endLine
	syscall
	
	li $v0, 4
	la $a0, string3
	syscall
	
	rem $a0,$t0,$t1  #   a0 = t0 % t1
	li $v0, 1
	syscall
	
	
		
	li $v0, 10
	syscall
	
	





