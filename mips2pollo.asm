.data
messagge: .asciiz "inserire numero: "
Pari: .asciiz "pari"
Dispari: .asciiz "dispari"


.text

addi $v0,$zero,4
la $a0,messagge
syscall 


addi $v0,$zero,5 # syscall per la lettura un intero
syscall #scanf

add $a0, $v0,$zero 

jal paridispari
move $s1,$v0

beq $s1,$zero,zero
	addi $v0,$zero,4
	la $a0,Pari
        syscall 
	j fin
	syscall  #CHIUSURA
	
zero:
	addi $v0,$zero,4
	la $a0,Dispari
       	syscall 
fin:
       	addi $v0,$zero,10 
       	syscall  #CHIUSURA

paridispari:
	#li $t0,2
	#div $a0,$t0
	#mfhi $t1
	andi $t1,$a0,0x0001 #tutti numeri pari finiscono con 0
	beq $t1,$zero,return1
		li $v0,0
		j exit
	return1:
		li $v0,1
	exit:
		jr $ra
