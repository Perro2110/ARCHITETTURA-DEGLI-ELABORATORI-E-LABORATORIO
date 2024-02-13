.data

w: .asciiz "w \n"
wm: .asciiz "wm  \n"
wM: .asciiz "wM  \n"
gg: .asciiz "gg  \n"

.text
li $t0,1 #m
li $t1,0 #g
li $t2,0 #i
	
loop:
	addi $v0,$zero,5
	syscall 
	addi $t1,$v0,0
	bne $t1,$t0,nugu
	addi $v0,$zero,4
	la $a0,gg
	syscall 
	j exit
	
	nugu:
		addi $v0,$zero,4
		la $a0,w
		syscall 
	blt $t1,$t0,magg
		addi $v0,$zero,4
		la $a0,wm
		syscall 
		j fin
	magg:
		addi $v0,$zero,4
		la $a0,wM
		syscall 
		
	
		
fin:		
addi $t2,$t2,1
blt $t2,10,loop
bne $t2,$t1,loop
exit:
	addi $v0,$zero,10
	syscall 
