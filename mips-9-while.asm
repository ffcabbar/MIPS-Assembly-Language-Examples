.data
string1: .asciiz "Enter a number:"
string2: .asciiz "Sum of digits = " # 
string3: .asciiz "Original number = " # 
endLine: .asciiz "\n"

.text


main:
	
	li $v0,4
	la $a0,string1
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	# tempNumber = number;
	# sumOfDigits = 0 ;
	# while ( tempNumber != 0 )
	# {
	#	digit = tempNumber % 10;
	#   sumOfDigits += digit;
	#	tempNumber /= 10;
	# }
	 
	move $t1,$t0 
	li   $t2,0
	
while:
	beq $t1,$zero,endWhile 
	rem $t3,$t1,10                                   #  123%10 = 3
	add $t2,$t2,$t3   
	div $t1,$t1,10				
	j while	

endWhile:
	li $v0,4
	la $a0,string2 
	syscall 

	li $v0,1
	move $a0,$t2 
	syscall
		
	li $v0,10
	syscall