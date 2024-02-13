.data
    space: .asciiz " "
    arr: .word 12 121 1322 522 6  # LA LUNGHEZZA E' 5
.text          #0 #4  #8  #12 #16
la $t0,arr
li $s0,0 #i
for:
bgt $s0,4,esciFor #PER NAVIGARE IL VETTORE PARTI DA 0 QUINDI ARRIVI A LUNGHEZZA -1
    mul $t1,$s0,4  #t1 è l'offset
    add $t2,$t1,$t0 #t2 è offset + indirizzo iniziale vet  # lw $a0, arr($t1)
    lw $a0,0($t2)                                          #
    li $v0,1
    syscall 
    
    ################## spazio solo per capire meglio la stampa###########
    li $v0,4
    la $a0,space
    syscall
    #####################################################################
    
    addi $s0,$s0,1
    j for
esciFor:
li $v0,10
syscall
		
