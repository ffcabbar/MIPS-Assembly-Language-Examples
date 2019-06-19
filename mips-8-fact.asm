#Fact

.data
string1: .asciiz "Enter a number:"
string2: .asciiz "! = " # 5! = 120
endLine: .asciiz "\n"

.text
main:

	li $v0,4
	la $a0,string1
	syscall
	
	li $v0,5
	syscall
	move $t2,$v0
	 
	li $t0,1						 			    # t0 -> result	
	li $t1,1                        	    	    # t1 -> loop counter
	
LoopStart:
	
	bgt  $t1,$t2,endLoop							# if (t1>t2) goto endLoop
	mul  $t0,$t0,$t1
	addi $t1,$t1,1                                  # ++i
	j LoopStart

endLoop:

	li   $v0,1	
	move $a0,$t2
	syscall            # -> print input number
	
	li $v0,4
	la $a0,string2
	syscall
	
	li $v0,1
	move $a0,$t0
	syscall            # -> print result
	
	li $v0,10
	syscall
	