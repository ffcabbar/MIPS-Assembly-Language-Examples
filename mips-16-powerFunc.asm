.data
string1: .asciiz "Enter base number:"
string2: .asciiz "Enter exp number:"
string3: .asciiz "Result:"
endLine: .asciiz "\n"
.text

#########################################################
powerFunction:
# a0 -> baseNumber       a1 -> expNumber		v0 -> result
	# result = 1;
	# counter = 0;
	# if (exp == 0)
	#  	return result;
	# for ( counter = 0; counter < expNumber ; ++counter )
	#	result = result*baseNumber
	# return result;		
	
	
	li $v0,1
	bne $a1,$zero,endif
	jr $ra
endif:
	li $t0,0
loop:
	bge $t0,$a1,endLoop
	mul $v0,$v0,$a0
	addi $t0,$t0,1
	j loop
endLoop:
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
	jal powerFunction
	move $a0,$v0
	li $v0,1
	syscall
			
	li $v0, 10
	syscall
	
	






