.data
PrintfUno: .asciiz "Inserire due numeri interi separandoli mediante CARRIAGE RETURN: "
pintfDue: .asciiz "Il minimo comune multiplo vale " 
pintfACapo: .asciiz "\n"

.text
 #NON SAPENDO CHE SAREBBERO SERVITI SOLO COME APPOGGI HO PREFERITO DICHIARARLI ESSENDO NEL CODICE C VARIABILI ISTANZIATE.
li $s0,0 #num1
li $s1,0 #num2
li $s2,0 #mcm
li,$s3,0 #mcd  
li $v0, 4           #
la $a0,PrintfUno   # PrintfUno
syscall           #

li $v0, 5                #
syscall                 # scanf(in $s0)
move $s0,$v0           #

li $v0, 5                #
syscall                 # scanf(in $s1)
move $s1,$v0           #


#/* chiamata della funzione minimoComuneMultiplo*/#

move $a0,$s0 # argomenti 
move $a1,$s1 # della funzione
jal minimoComuneMultiplo
move $s2,$v0
 
li $v0, 4           #
la $a0,pintfDue    # pintfDue
syscall           #

move $a0,$s2              #
li $v0, 1                # printa s2
syscall                 # 

li $v0, 4           #
la $a0,pintfACapo  # pintfACapo
syscall           #


 li $v0,10
 syscall                 
 
 
minimoComuneMultiplo:
	addi $sp,$sp,-28

	sw $s3, 24($sp) #mcd		
	sw $s2, 20($sp) #mcm
	sw $s1, 16($sp) #num2	
	sw $s0, 12($sp) #num1
	sw $a0, 8($sp) #n1		
        sw $a1, 4($sp) #n2				
	sw $ra, 0($sp) #RA	


	jal massimoComunDivisore
	
	lw $ra, 0($sp) #RA	
	lw $a1, 4($sp) #n2	
	lw $a0, 8($sp) #n1
	
	move $t1,$v0 
	mul $t0,$a0,$a1 
	div $v0,$t0,$t1


	lw $s0, 12($sp) #num1
	lw $s1, 16($sp) #num2
	lw $s2, 20($sp) #mcm
	lw $s3, 24($sp) #mcd
	addi $sp,$sp,28	
        jr $ra

massimoComunDivisore:
	addi $sp,$sp,-24      #Per sicurezza mi storro tutto non sapendo cosa "potrei toccare"
	sw $s3, 20($sp) #mcd		
	sw $s2, 16($sp) #mcm
	sw $s1, 12($sp) #num2	
	sw $s0, 8($sp) #num1
	sw $a0, 4($sp) #n1		
        sw $a1, 0($sp) #n2					

	move $s0,$a0 # a=n1
	move $s1,$a1 # b=n2

	while:
	ble $s1,0,EXIT
		div $s0,$s1
		mfhi $s2
		move $s0,$s1
		move $s1,$s2
	j while
	EXIT:
	move $v0,$s0

	lw $a1, 0($sp) #n2
	lw $a0, 4($sp) #n1
	lw $s0, 8($sp) #num1
	lw $s1, 12($sp) #num2	
	lw $s2, 16($sp) #mcm		
	lw $s3, 20($sp) #mcd	
	addi $sp,$sp,24	
	
	jr $ra


       
	
	
	
	
