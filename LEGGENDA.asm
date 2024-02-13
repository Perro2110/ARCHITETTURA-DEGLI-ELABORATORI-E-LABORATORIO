.data
	arr: .word 12 121 1322 522 6
	length: .word 5
.text
	la $a0,arr        #arr
	lw $a1,length     #n #a0 e a1 perchè cosi me li porto nelle funzioni
	jal insertionSort
	jal printArray
	
	addi $v0,$zero,10 
        syscall  #CHIUSURA

insertionSort:
addi $sp,$sp,-12
	sw $s2,8($sp) #j
	sw $s3,4($sp) #key
	sw $s0,0($sp) #i
	li $s0,1 #i
	
	for:
	bge $s0,$a1,esciFor
	        sll $t0,$s0,2
	        move $t6,$t0
	        add $t6,$t6,$a0
		lw $s3,0($t6)
		addi $s2,$s0,-1
		    
	        while:    	
		        sll $t1,$s2,2	

		        move $t7,$t1
	        	add $t7,$t7,$a0
			lw $s1,0($t7)
		

			blt $s2,0,casa
			ble $t7,$s1,casa
		   	lw $t3,0($t7)
		   	sll $t7,$t7,2
		   	add $t7,$t7,$a0
		   	sw $s3,0($t7)
		   	addi $s2,$s2,-1
		 	j while
		 casa: 
		   sll $t7,$t7,4
		   sw $s3,0($t7)
        
        addi $s0,$s0,1
        j for
        		   
	esciFor:
	lw $s2,8($sp) #j
	lw $s3,4($sp) #key
	lw $s0,0($sp) #i

	addi $sp,$sp,12
	jr $ra
	
printArray:
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
		addi $s0, $s0, 1
		j forprint
	esciprint:
	lw $s0, 0($sp)
	addi $sp, $sp, 4
	jr $ra
		
