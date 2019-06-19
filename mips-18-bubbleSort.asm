

#bubble sort
.data

endLine: .asciiz "\n"
array:	.word 5, 3, 4, 6, 1

.text

display:
	la $s3,array                   # address
	li $t0,0                        # cnt
	startLoop:
	bge $t0,5,endLoop
	li $t1,4
	mul $t1,$t1,$t0
	add $t2,$s3,$t1
	lw $t3,0($t2)
	
	li $v0,1
	move $a0,$t3
	syscall
	
	li $v0,4
	la $a0,endLine
	syscall
	
	addi $t0,1
	j startLoop
endLoop:
	jr $ra



sort:

	#for (int i = 0 ; i < 5 - 1; ++i) 
	#{
	#	for (int j = 0 ; j < 5 - 1 - j; ++i) 
	#	{
	#		if( array[j] > array[j+1] )
	#		{
	#			temp = array[j];
	#			array[j] = array[j+1];
	#			array[j+1] = temp;
	#			// swap
	#		}
	#	
	#	}
	#}

	la $s0,array
	li $t0,0 # i
	li $t9,4 # size-1
	
sortLoop1:
	bgt $t0,$t9,sortEndloop1
		li $t1,0 # j
		sub $t2,$t9,$t1
		
			sortLoop2:
				bgt $t1,$t2,sortEndloop2
					mul $t3,$t1,4
					add $t4,$s0,$t3
					
					lw $t5,0($t4)
					lw $t6,4($t4)
					
					bgt $t5,$t6,swap					
					j endSwap
					swap:
						move $t7,$t5
						move $t5,$t6
						move $t6,$t7
						
						sw $t5,0($t4)
						sw $t6,4($t4)						
					endSwap:				
				addi $t1,1
				j sortLoop2	
			sortEndloop2:	
			
	addi $t0,1
	j sortLoop1
sortEndloop1:

	jr $ra


main:

	
	jal display
	jal sort
	jal display

	
	li $v0, 10
	syscall
	
	






