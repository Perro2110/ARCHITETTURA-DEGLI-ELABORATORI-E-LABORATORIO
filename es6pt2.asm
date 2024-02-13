.data
pollo2: .asciiz "is "
pollo: .asciiz "is not"
.text
li $t0,0 #x
li $t2,2 #z
li $t3,0 #z

	addi $v0,$zero,5
	syscall 
	addi $t0,$v0,0

loop:	

	div $t0,$t2
	mfhi $t4
	bge  $t2,$t0,stampa
	addi $t2,$t2,1
	bnez $t4,loop

	li $t3,1
	addi $v0,$zero,4
	la $a0,pollo
	syscall 
	j exit2
	


stampa:
	bnez $t3,exit2
	addi $v0,$zero,4
	la $a0,pollo2
	syscall 
exit2:
	addi $v0,$zero,10
	syscall 
