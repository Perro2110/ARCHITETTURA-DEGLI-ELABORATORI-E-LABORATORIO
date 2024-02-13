.data
	array1size: .word 5
	array2size: .word 6
	a: .word 1,2,3,4,5
	b: .word 6,7,8,9,10,11

	spazio: .asciiz " "

.text 
	lw $s0,array1size
	lw $s1,array2size
	
	la $s2,a      #indirizzo del vettore a
	la $s3,b  	  #indirizzo del vettore b

	add $t0,$s0,$s1
	sll $t0,$t0,2 
	
	li $v0,9
	move $a0,$t0
	syscall 
	
	move $s4,$v0
	
	li $t0,0    #inizializzo $t0 come contatore del ciclo for
	move $t1,$s2 #indirizzo vettore a
	move $t2,$s4 #indirizzo di c
	
	for_array1:
		beq $t0,5,for_array2
			lw $t3,0($t1)   #prendo il valore da a
			sw $t3,0($t2)   #metto il valore di a in c
			
			addi $t1,$t1,4	
			addi $t2,$t2,4
			
			addi $t0,$t0,1
			j for_array1
			
	move $t1,$s3    #riutilizziamo $t1 per caricare il vettore b	
	for_array2:
		beq $t0,11,fine
			lw $t3,0($t1)
			sw $t3,0($t2)

			addi $t1,$t1,4	
			addi $t2,$t2,4
			
			addi $t0,$t0,1
			j for_array2
			
	fine:
		li $t0,1
		move $t1,$s4 #carico l'indirizzo del vettore c in $t1
		stampa:
			beq $t0,12,chiusura
				li $v0,1
				lw $a0,0($t1)
				syscall
				
				li $v0,4
				la $a0,spazio
				syscall
			
				addi $t1,$t1,4
				addi $t0,$t0,1
				j stampa
		
	chiusura:
		li $v0,10
		syscall
