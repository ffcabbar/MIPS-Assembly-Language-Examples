.data
string1: .asciiz "Enter a number : "
endLine: .asciiz "\n"
string2: .asciiz "a is equal to be : "
string3: .asciiz "a is not equal to be  : "

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

beq $t0,$t1, if_label
j else_label

if_label:

li $v0,4
la $a0,string2
syscall
j end_label


else_label:

li $v0,4
la $a0,string3
syscall

end_label:
li $v0, 10        #exit
syscall



