.data
x: .word 41
text: .asciiz "you succed !"
.text
lw $s0,x
addi $s0,$s0,1
li $t0,42
bne $s0,$t0,fin
	addi $v0,$zero,4
	la $a0,text
       	syscall 
fin:
       	addi $v0,$zero,10 
       	syscall  #CHIUSURA
