.data
textL: .asciiz "The value is less than 10"
textG: .asciiz "The value is greater than 10"
.text

addi $v0,$zero,5 # syscall per la lettura un intero
syscall #scanf

add $s0, $v0,$zero 
li $t0,10

blt $s0,$t0,Less
	addi $v0,$zero,4
	la $a0,textG
       	syscall 
       	j exit
   
Less:
 	addi $v0,$zero,4
	la $a0,textL
       	syscall 
       	j exit
    
exit:
       	addi $v0,$zero,10 
       	syscall  #CHIUSURA
