.data
.text
li $t0,0 #i
loop:	
	li $t1,0 #j
	loop1:
	
		move $a0,$t0
		addi $v0,$zero,1
		syscall 
		move $a0,$t1
		addi $v0,$zero,1
		syscall 
	addi $t1,$t1,1
	blt $t1,4,loop1
addi $t0,$t0,1
blt $t0,2,loop
exit:
	addi $v0,$zero,10
	syscall 
