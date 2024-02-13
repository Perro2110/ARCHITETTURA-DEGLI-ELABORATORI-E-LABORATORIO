.data
messagge: .asciiz "inserire numero: "
Pari: .asciiz "pari"
Dispari: .asciiz "dispari"


.text

addi $v0,$zero,4
la $a0,messagge
syscall 

addi $v0,$zero,5 # syscall per la scrittura di un intero
syscall #scanf

add $a0, $v0,$zero 

jal paridispari #prima della jal no t quindi non salvo
move $s1,$v0

bne $s1,$zero,zero
	addi $v0,$zero,4
	la $a0,Pari
        syscall 
	addi $v0,$zero,10 
	syscall  #CHIUSURA
	
zero:
	addi $v0,$zero,4
	la $a0,Dispari
       	syscall 
       	addi $v0,$zero,10 
       	syscall  #CHIUSURA

paridispari:  #non uso altro che t quindi non salvo nulla
	li $t0,2
	div $a0,$t0
	mfhi $t1
	beq $t1,$zero,return0
		li $v0,1
		j exit
	return0:
		li $v0,0
	exit:
		jr $ra
