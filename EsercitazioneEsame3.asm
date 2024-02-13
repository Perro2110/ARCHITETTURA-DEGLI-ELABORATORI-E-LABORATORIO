.data

PrintfUno: .asciiz "Enter the number of rows: "
pintfDue: .asciiz "\nEnter the number of columns: " 
pintfACapo: .asciiz "\n"

.text
li $s0,0 #rows
li $s1,0 #columms
li $s2,1 #k
li $s3,1 #i

li $v0, 4           #
la $a0,PrintfUno   # PrintfUno
syscall           #

li $v0, 5                #
syscall                 # scanf(in $s0)
move $s0,$v0           #

li $v0, 4           #
la $a0,pintfDue    # pintfDue
syscall           #

li $v0, 5                #
syscall                 # scanf(in $s1)
move $s1,$v0           #

while:
	bgt $s3,$s0,EXIT
	li $s4,1 #j
	whileSecondo:
	bgt $s4,$s1,EXITSECONDO
		move $a0,$s2              #
		li $v0, 1                # printa s2
		syscall                 # 
		addi $s2,$s2,1
		addi $s4,$s4,1	
		j whileSecondo
	EXITSECONDO:
	addi $s3,$s3,1
	li $v0, 4           #
	la $a0,pintfACapo  # pintfACapo
	syscall           # 
	j while
EXIT:		

 li $v0,10
 syscall                 
 
 
 

 
