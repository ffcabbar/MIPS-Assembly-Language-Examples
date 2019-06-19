.data
string1: .asciiz  "Enter a number :"
endLine: .asciiz  "\n"
string2: .asciiz  "Addition : "
string3: .asciiz  "Dividition : "
string4: .asciiz  "Remainder : "
string5: .asciiz  "Multiplication : "

.text
main:

li $v0,4
la $a0,string1
syscall

li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,endLine
syscall

li $v0,4
la $a0,string1
syscall

li $v0,5
syscall
move $t1,$v0


beq $t0,$t1, Addition
j Dividition

Addition:

li $v0,4
la $a0,string2
syscall

add $t2,$t1,$t0
move $a0,$t2

li $v0,1
syscall
j exit

Dividition:

li $v0,4
la $a0,string3
syscall

div $t0,$t1
mflo $a0
li $v0,1
syscall

li $v0,4
la $a0,endLine
syscall

li $v0,4
la $a0,string4
syscall

mfhi $a0
li $v0,1
syscall

li $v0,4
la $a0,endLine
syscall


li $v0,4
la $a0,string5


mul $t2,$t1,$t0
syscall
move $a0,$t2
li $v0,1
syscall
j exit


exit:
li $v0,10
syscall