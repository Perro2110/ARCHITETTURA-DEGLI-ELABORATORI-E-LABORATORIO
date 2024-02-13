.data
arr: .word 12 121 1322 522 6
length: .word 5
space: .asciiz "__"

.text

main:
	la $a0, arr
	lw $a1, length
	jal insertionsort
	jal printarray
	li $v0, 10
	syscall

insertionsort:
	addi $sp, $sp, -12

	sw $s0, 8($sp) #i
	sw $s1, 4($sp) #j
	sw $s2, 0($sp) #key
	li $s0,0
	
	for:
	addi $s0,$s0,1
	beq $s0,$a1,exitIns
	#{
		mul $t0,$s0,4 
		add $t0,$t0,$a0
		lw $s2,0($t0)
		addi $s1,$s0,-1
		#while (j >= 0 && arr[j] > key){
		
		while:
		mul $t1,$s1,4
		add $t1,$t1,$a0
		lw $t3,0($t1) # t3 = array [j]
		blt $s1,0,FUORIWHILE
		ble $t3,$s2,FUORIWHILE
		#{
			addi $t7,$t1,4
			sw $t3,0($t7)
			addi $s1,$s1,-1
		j while
		#}arr[j + 1] = key;		
		FUORIWHILE: 
			addi $t7,$t1,4
			sw $s2,0($t7)
		j for  	
	#}
	
	exitIns:
	lw $s2, 0($sp) #key
	lw $s1, 4($sp) #j
	lw $s0, 8($sp) #i
	
	addi $sp, $sp, 12
	jr $ra
	

printarray:
	addi $sp, $sp, -4
	sw $s0, 0($sp)
	li $s0, 0
	move $t1, $a0
	forprint:
	beq $s0, $a1, esciprint
		sll $t0, $s0, 2
		add $t0, $t0, $t1
		lw $a0, 0($t0)
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, space
		syscall
		addi $s0, $s0, 1
	j forprint
	esciprint:
	lw $s0, 0($sp)
	addi $sp, $sp, 4
jr $ra
