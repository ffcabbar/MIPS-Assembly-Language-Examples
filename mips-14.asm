
.text

sumoftimestwo:

	addi $sp,$sp,-4
	sw $s0,$sp

	mul $a0,$a0,2
	mul $a1,$a1,2
	mul $a2,$a2,2
	
	add $v0,$a0,$a1
	add $v0,$v0,$a2
	
	div $v0,$v0,2
		
	lw $s0,$sp
	addi $sp,$sp,-4
	
	jr $ra

main:
	
	li $a0,1
	li $a1,2
	li $a2,3
	jal sumoftimestwo
	
	move $a0,$v0
	li $v0,1
	syscall

	li $v0, 10
	syscall
	
	






