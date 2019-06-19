.data

string1: .asciiz "For add press 1, For sub press 2, For div press 3, For mult press 4,For remaminder press 5: "
string2: .asciiz "Enter a number: "
endLine: .asciiz "\n"
addition: .asciiz "Addition : "
subtraction: .asciiz "subtraction : "
dividition: .asciiz "dividition : "
multplication: .asciiz "multplication : "
remainder: .asciiz "Remainder is: "

.text
main:

	li $v0,4
	la $a0,string2
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	li $v0,4
	la $a0,string2
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,4
	la $a0,endLine
	syscall
	
	li $v0,4
	la $a0,string1
	syscall
	
	li $v0,4
	la $a0,endLine
	syscall
	
	li $v0,5
	syscall
	move $t2,$v0
	
	beq $t2,1,Addition
	beq $t2,2,Subtraction
	beq $t2,3,Dividition	
	beq $t2,4,Multplication
	beq $t2,5,Remainder	
	
Addition:

	li $v0,4
	la $a0,addition
	syscall
	
	li $v0,4
	la $a0,endLine
	syscall
		
	add $t3,$t0,$t1
	move $a0,$t3
	
	li $v0,1
	syscall
	j Exit
	
Subtraction:

	li $v0,4
	la $a0,subtraction
	syscall
			
	sub $t3,$t0,$t1
	move $a0,$t3
	
	li $v0,1
	syscall
	j Exit	

Dividition:

	li $v0,4
	la $a0,dividition
	syscall
			
	div $t0,$t1
	mflo $a0	
	li $v0,1
	syscall
		
	
	j Exit	
	
Multplication:

	li $v0,4
	la $a0,multplication
	syscall
			
	mul $t3,$t0,$t1
	move $a0,$t3
	
	li $v0,1
	syscall
	j Exit	

Remainder:
	
	li $v0,4
	la $a0,remainder
	syscall

	
	rem $t3,$t0,$t1
	move $a0,$t3
	li $v0,1
	syscall
	j Exit

Exit:

li $v0,10
syscall
	



	
	