.data
x: .word 1 2 3 4 5
y: .word 1 2 3 4 55
len: .word 5

printUno: .asciiz "Viene "
aCapo: .asciiz "\n"
space: .asciiz " "

.text
#preferisco fin da subbito usare come indirizzi gli "a" e
#ssendo che nel main l'unica cosa che viene fatta di uesti è
# essere spediti in funzione
la $s0,x
la $s1,y
lw $s2,len #leght

move $a0,$s0 # *X
move $a1,$s1 # *Y
move $a2,$s2 #  N

jal cocorrelationCoefficient

move $t0,$v0 #uso t0 essendo che non mette il retunr in variabile ma la stampa direttamente

li $v0, 4           #
la $a0,printUno    # PrintfUno
syscall           #

li $v0, 1       #
move $a0,$t0   # n
syscall       #

li $v0, 4           #
la $a0,aCapo       # \n
syscall           #

li $v0,10
syscall


cocorrelationCoefficient:
	addi $sp,$sp,-16
	sw $s3, 12($sp)   #corr potrei usarla anche solo come v0 ma in codice è variabile istanziata e inizializzata... preferisco quindi usare s
	sw $s2, 8($sp)   #sum_XY 		
	sw $s1, 4($sp)  #sum_Y  				
	sw $s0, 0($sp) 	#sum_X 
	#NB LI INIZIALIZZA		
	li $s0,0
	li $s1,0
	li $s2,0
	
	li $t0,0 # i
	for:
	bge $t0,$a2,EsciFor
		mul $t1,$t0,4
		
		add $t2,$t1,$a0   #t2=offset(t1)+indirizzoX
		lw $t3,0($t2)    #sum_X = sum_X + X[i];
		add $s0,$s0,$t3
		
		add $t2,$t1,$a1    #t2=offset(t1)+indirizzoY
		lw $t4,0($t2)	   # sum_Y = sum_Y + Y[i];
		add $s1,$s1,$t4
		
		mul $t5,$t3,$t4
		add $s2,$s2,$t5   # sum_XY = sum_XY + X[i] * Y[i];
		
		addi $t0,$t0,1
		j for
	EsciFor:
	#Stampo tutti i numeri printf("%d %d %d\n", sum_X, sum_Y, sum_XY);
	li $v0, 1       #
	move $a0,$s0   # n
	syscall       #	
	
	li $v0, 4           #
	la $a0,space       #  __
	syscall           #

	li $v0, 1       #
	move $a0,$s1   # n
	syscall       #	

	li $v0, 4           #
	la $a0,space       #  __
	syscall           #

	li $v0, 1       #
	move $a0,$s2   # n
	syscall       #	
	
	li $v0, 4           #
	la $a0,aCapo       # \n
	syscall           #
	
	mul $t6,$a2,$s2 # n * sum_XY 
	mul $t7,$s0,$s1 # sum_X * sum_Y
	sub $s3,$t6,$t7 #int corr = n * sum_XY - sum_X * sum_Y;
	
	move $v0,$s3
	
	lw $s0,0($sp)
	lw $s1,4($sp)
	lw $s2,8($sp)
	lw $s3,12($sp)
	
	addi $sp,$sp,16

jr $ra

