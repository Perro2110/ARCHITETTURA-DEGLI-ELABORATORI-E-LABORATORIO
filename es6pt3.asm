.data
.text
li $t0,0 #sum
li $t1,10 #count
li $t2,0 #i
move $t2,$t1
loop:	
	move $a0,$t1
	addi $v0,$zero,1
	syscall 
	
	addi $t2,$t2,-1
	add $t0,$t0,$t2	
	bge   $t2,1,loop

exit:
	addi $v0,$zero,10
	syscall 
