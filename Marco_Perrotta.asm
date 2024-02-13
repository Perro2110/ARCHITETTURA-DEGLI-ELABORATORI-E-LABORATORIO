.data 
arr: .word 1 2 3 4 5 6
length: .word 6
key: .word 3

print: .asciiz "Element found at position: "

.text
#inizializzo le variabili:
la $s0,arr    #int arr[] = { 1, 2, 3, 4, 5, 6 };
lw $s1,length # int n=6
lw $s2,key    # int key =3

# "travaso" le variabili dai $s ai $a per poi utilizzarli come parametri della funzione
move $a0,$s0 #arr gestito poi nella funzione come arr
move $a1,$s1 #n gestito poi nella funzione come  size
move $a2,$s2 #key gestito poi nella funzione come key

jal findElement # findElement(arr, n, key);

li $v0,10
syscall

findElement:
		#SALVATAGGIO DEI REGISTRI 
	addi $sp,$sp,-12	#creo spazio per 3 registri nello stack ... 3*4
	sw $s2, 8($sp) 		#Salvo $s2 in stack
	sw $s1, 4($sp) 		#Salvo $s1 in stack	
	sw $s0, 0($sp) 		#Salvo $s0 in stack ... utilizzandolo poi come i	
		#CORPO DELLA PROCEDURA
	li $s0,0 #i=0 
	for:
	bge $s0,$a1,FuoriFor
		mul $t0,$s0,4 #avrei potuto utilizzare un sll di 2, ma per una maggiore leggibilita ho preferito utilizzare mul di 4
		add $t0,$t0,$a0 
		lw $t1,0($t0)
		bne $t1,$a2,NotIf
				li $v0, 4           #             
				la $a0,print       # Mi permetto di utilizzare $a0, perdendo il parametro "valore/indirizzo" di array essendo non più necessario essendo che se entrato qui, è finita la funzione
				syscall           #        printf("Element found at position: ...

				addi $t0,$s0,1   #      
				li $v0, 1       #
				move $a0,$t0   # 
				syscall       #	  ... %d ", (i + 1));
				
				j FuoriFor	#  break;
		NotIf:
	addi $s0,$s0,1
	j for
	
	FuoriFor:
			#RIPRISTINO DEI REGISTRI
	lw $s0, 0($sp) 
	lw $s1, 4($sp) 	
	lw $s2, 8($sp) 		
	addi $sp,$sp,12
			#RITORNO ALLA PROCEDURA
	jr $ra