.data
space: .asciiz " "
arrUno: .word 1 2 3 4 5
arrDue: .word 6 7 8 9 10 11
lengthUno: .word 5
lengthDue: .word 6

# /******************************************************************************
# Allocazione della memoria dinamica: si utilizzi la SYSCALL numero 9, che funziona nel seguente modo:
# li $v0, 9 # codice della SYSCALL in $v0
# li $a0, NUM_BYTE # numero di BYTE da istanziare in heap (ovvero lunghezza_array_c x 4) in $a0
# syscall
# La SYSCALL ritorna in $v0 l’indirizzo di base del nuovo array allocato in memoria dinamica. Da quel momento, quell’array si può referenziare come un qualunque altro array con indirizzo di base contenuto in $v0.
#*******************************************************************************/

.text
lw $s0,lengthUno
lw $s1,lengthDue

la $s6,arrUno    # disordinato perche inizialmente non prevista tale la
la $s7,arrDue    # con metodo lorenzo lw $t4,arrUno($t0) 

add $s2,$s0,$s1 #LenghtTRE
mul $a0,$s2,4
li $v0, 9 # codice della SYSCALL in $v0
syscall
move $s3,$v0 #indirizzo del TERZO VETTORE

li $s4,0 #i 

for:
bge $s4,$s0,esciFor

   mul $t0,$s4,4  #t0 è l'offset
   
   add $t2,$t0,$s6        #t2 è offset + indirizzo iniziale 1°vet  
   lw $t4,0($t2)          # lw $t4,arrUno($t0) 
   
   add $t1,$t0,$s3 #t1 è = offset + indirizzo iniziale vet  3 # lw $a0, arr($t0)
   sw $t4,0($t1)               
   addi $s4,$s4,1
   j for
esciFor:

li $s5,0 #j 

forSECONDO:
bge $s5,$s1,esciForSECONDO
   mul $t0,$s5,4  #t0 è l'offset con j
   
   add $t2,$t0,$s7         #t2 è offset + indirizzo iniziale 2°vet  
   lw $t4,0($t2)           # lw $t4,arrDue($t0) 
                          #prendo il valore del secondo vettore 
   
   mul $t3,$s4,4  #offset con i che continua ad aumentare
   add $t1,$t3,$s3 #t1 è offset + indirizzo iniziale 3°vet  
   sw $t4,0($t1) #metto valore del secondo vettore nella posizione nuova del terzo vettore              
   addi $s4,$s4,1  # aggiorno entrambi i miei indici
   addi $s5,$s5,1  # aggiorno entrambi i miei indici
   j forSECONDO
esciForSECONDO:

li $s4,0 #i
forFINALE:
bge $s4,$s2,esciForFINALE
    mul $t0,$s4,4  #t0 è l'offset
    add $t1,$t0,$s3 #t1 è offset + indirizzo iniziale vet  # lw $a0, arr($t0)
    lw $a0,0($t1)                                          #
    li $v0,1
    syscall 
    
    ################## spazio solo per capire meglio la stampa###########
    li $v0,4
    la $a0,space
    syscall
    #####################################################################
    
    addi $s4,$s4,1
    j forFINALE
esciForFINALE:

li $v0,10
syscall