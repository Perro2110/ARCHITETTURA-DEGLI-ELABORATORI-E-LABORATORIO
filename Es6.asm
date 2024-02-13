.data

.text
li $t0,0
li $t1,10
#uno trasforma un for in un do while perche si specula per il taken 
loop:	
	move $a0,$t0
	addi $v0,$zero,1
	syscall 
	addi $t0,$t0,1
bne $t0,$t1,loop

exit:
	addi $v0,$zero,10
	syscall 
