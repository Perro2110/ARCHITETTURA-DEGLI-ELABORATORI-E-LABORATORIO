.data
n: .word  45
space: .asciiz " "

.text

lw $s0,n
move $a0,$s0
jal primeFactors
li $v0,10
syscall

primeFactors:
	addi $sp,$sp,-12

	sw $s0, 8($sp) #i
	sw $a0, 4($sp) #n						
	sw $ra, 0($sp) #RA
	
	while:
		div $t0,$a0,2
		mfhi $t1
		bne $t1,0,FuoriWhile
		
		li $v0, 1       #
		li $a0,2       # n
		syscall       #	
		
		li $v0, 4           #
		la $a0,space       #  __
		syscall           #	
	
		move $a0,$t0
		j while
	
	FuoriWhile:
	
	li $s0,3 #i=3
	jal ssqroot  # a0=n
	move $t2,$v0 # ssqroot(n)
	
	forSecondo:
	bgt $s0,$t2,esciForSecondo
		whileSecondo:
			div $t3,$a0,$s0
			mfhi $t4
			bne $t4,0,whileSecondoExit
			move $t5,$a0  #stampo senza perdere a0...
				li $v0, 1       #
				move $a0,$s0       # n
				syscall       #	
				li $v0, 4           #
				la $a0,space       #  __
				syscall           #	
			move $a0,$t5 # ...ritravaso
			move $a0,$t3
			j whileSecondo
			whileSecondoExit:	
		addi $s0,$s0,2
	j forSecondo
	
	esciForSecondo:
	ble $a0,2,escitoto
	
	li $v0, 1       #
	syscall         #	
	
	escitoto:
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $s0, 8($sp)
	addi $sp,$sp,12	
	
	jr $ra
	
 ssqroot:
 	addi $sp,$sp,-8

	sw $s1, 4($sp) #i
	sw $s0, 0($sp) #x						
	
	move $s0,$a0
	div $t2,$a0,2
	li $s1,0
	
	for:
		bge $s1,$t2,esciFor
		div $t3,$a0,$s0
		add $t4,$s0,$t3
		div $s0,$t4,2
	
		addi $s1,$s1,1
	j for
	esciFor:
	move $v0,$s0
	
	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	addi $sp,$sp,8	
	
	jr $ra
