.data
space: .asciiz "Is divisible "
space2: .asciiz "Is not divisible "

.text

main:

	jal diplay
	li $v0, 10
	syscall
	
 
diplay:
	
	addi $sp, $sp, -8
	sw $ra, 4($sp) #ra
	sw $a0, 0($sp)
	li $a0,1
	for:
	li $t0,10
	bgt $a0,$t0,exit
	sw $a0, 0($sp)
	jal cube

	move $a0,$v0

		li $v0,1
		syscall
	lw $a0, 0($sp)
	addi $a0,$a0,1
		j for
	exit:
	lw $a0, 0($sp)
	lw $ra, 4($sp) #ra

	addi $sp,$sp,8
	jr $ra
	
cube:
	li $v0,1
	 mul $v0,$v0,$a0
	 mul $v0,$v0,$a0
	 mul $v0,$v0,$a0
         jr $ra

