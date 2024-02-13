.data
.text
li $t0,1
li $t2,0
	addi $v0,$zero,5
	syscall 
	addi $t1,$v0,0

#uno trasforma un for in un do while perche si specula per il taken 
loop:	
	move $a0,$t2
	addi $v0,$zero,1
	syscall 
	addi $t0,$t0,1
	add $t2,$t2,$t0
ble   $t0,$t1,loop

exit:
	addi $v0,$zero,10
	syscall 
