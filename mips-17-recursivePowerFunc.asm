.data
string1: .asciiz "Enter base number:"
string2: .asciiz "Enter exp number:"
string3: .asciiz "Result:"
endLine: .asciiz "\n"
.text

#########################################################
recursivePowerFunction:
# a0 -> baseNumber       a1 -> expNumber		v0 -> result
#	recursivePowerFunction
#	   if (expNumber == 0)
#			return 1;
#	   else
#		   return baseNumber * recursivePowerFunction(baseNumber,expNumber - 1)

	bne $a1,$zero,recursion
	li $v0,1
	jr $ra
recursion:
	addi $sp,-4
	sw $ra,0($sp)
	addi $a1,$a1,-1
	jal recursivePowerFunction
	mul $v0,$v0,$a0
	lw $ra,0($sp)
	addi $sp,4
	jr $ra
	
	
#########################################################
main:
	li $v0, 4
	la $a0, string1
	syscall

	li $v0,5	
	syscall
	move $t0,$v0
	
	li $v0, 4
	la $a0, string2
	syscall

	li $v0,5
	syscall
	move $t1,$v0
	
	move $a0,$t0
	move $a1,$t1
	jal recursivePowerFunction
	move $a0,$v0
	li $v0,1
	syscall
			
	li $v0, 10
	syscall
	
	






