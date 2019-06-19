.data
string1: .asciiz "Enter a number : "
endLine: .asciiz "\n"
string2: .asciiz "Lower Part : "
string3: .asciiz "Higher Part : "

.text
main:

li $v0,4
la $a0,string1
syscall

li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,string1    #cout<<Enter a number
syscall

li $v0,5
syscall
move $t1,$v0

li $v0,4
la $a0,string2    #cout<<Lower Part
syscall

div $t0,$t1
mflo $a0
li $v0,1
syscall

li $v0,4
la $a0,endLine    #cout<<Lower Part
syscall

mfhi $a0          #remainder
li $v0,1
syscall

li $v0,1
syscall



li $v0, 10        #exit
syscall