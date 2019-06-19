.data
endLine: .asciiz "\n"

.text
main:
	li $t9,0x10000000 # base address
	
	li $t0,15
	sw $t0,24($t9)
	
	li $t0,25
	sw $t0,28($t9)
	
	lw $t1,24($t9)
	lw $t2,28($t9)
	sw $t1,28($t9)
	sw $t2,24($t9)
	
	lw $t1,24($t9)
	li $v0,1
	move $a0,$t1
	syscall
	
	li $v0,4
	la $a0,endLine
	syscall
	
	lw $t1,28($t9)
	li $v0,1
	move $a0,$t1
	syscall
		
	li $v0, 10
	syscall
	
	






