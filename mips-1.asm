.data
string1: .asciiz "Enter a number:"
string2: .asciiz "Enter the secon number:"
string3: .asciiz "Sum:"
endLine: .asciiz "\n"

.text
main:

	li $v0 , 4				#print string1 
	la $a0 , string1  
	syscall

	li $v0 , 5	 			#read integer
	syscall
	
	move $t0,$v0            #Girdiğimiz integer değeri temporary(geçici) değere akttardık.
	
	li $v0 , 4
	la $a0 , endLine        #Boşluk vermek için. 
	syscall
	
	li $v0 , 4
	la $a0 , string2        
	syscall
	
	li $v0 , 5
	syscall
	
	move $t1,$v0             
	
	li $v0 , 4
	la $a0 , string3
	syscall
	
	add $t2,$t1,$t0			#İki tane yazdığımız integer değerleri toplayıp $t2 temporary değere aktardık.s
	li $v0, 1			    #print integer
	move $a0, $t2			#Temporary değeri a0 a aktardık.
	syscall
	
		 
	li $v0, 10              #exit
	syscall
	
