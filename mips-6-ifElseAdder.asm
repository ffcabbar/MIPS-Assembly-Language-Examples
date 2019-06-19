.data

string1: .asciiz "Enter a number : "
string2: .asciiz "Summation of adding : "
string3: .asciiz "You can not sum these numbers because they are NOT same !: "
endLine: .asciiz "\n"

.text
main:

li $v0,4
la $a0,string1
syscall        #std::cout<<string1

li $v0,5
syscall
move $t0,$v0    #$t0 = $v0

li $v0,4
la $a0,endLine   #cout<<endLine;
syscall

li $v0,4
la $a0,string1
syscall        #std::cout<<string1

li $v0,5
syscall
move $t1,$v0

li $v0,4        # print integer
la $a0,endLine    #cout<<endLine;
syscall

li $v0,4
la $a0,string2
syscall


beq $t0,$t1, SUM
j ALERT


SUM : 
add $t2,$t0,$t1
li $v0,1
move $a0,$t2
syscall
j EXIT

ALERT : 
li $v0,4
la $a0,string3
syscall
j EXIT

EXIT:
li $v0,10       #exit
syscall