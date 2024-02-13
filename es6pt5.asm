.data
.text
li $t0,0 #i
li $t1,0 #j
li $t2,0 #k

li $t6,2
li $t7,3
loop:	
	li $t1,0 #j
	loop1:
		li $t2,0 #k
			loop2:
				move $a0,$t2
				addi $v0,$zero,1
				syscall 
			addi $t2,$t2,1
			blt $t2,$t6,loop2
		addi $t1,$t1,1
		blt $t1,$t6,loop1
	addi $t0,$t0,1
	blt $t0,$t7,loop
exit:
	addi $v0,$zero,10
	syscall 
