################################################
#stupido
################################################
.data
i: .word 3
j: .word 2
.text
lw $s0,i
lw $s1,j
blt $s0,$s1,t
#slt $t0,$s0,$s1
#bne $t0,$0,t
 j END
t:
 li $s3,0  #intoIF
END:
#add $a0, $s3,$0
move $a0, $s3# travaso del valore della funzione in $a0
li $v0,1 # syscall per la output di un intero
syscall # stampa il valore letto
li $v0,10 # syscall per Chiudere
syscall # Chiudere

################################################
#Inteligente -- ESIGO --
################################################
.data
i: .word 3
j: .word 6
.text
lw $s0,i
lw $s1,j


#slt $t0,$s0,$s1
#beq $t0,$0,t #salto se i>=j
bge $s0,$s1,Exit #se piu piccolo s0 entra altrimenti vai a t
li $s3,1  #intoIF

Exit:
#add $a0, $s3,$0
move $a0, $s3# travaso del valore della funzione in $a0
li $v0,1 # syscall per la output di un intero
syscall # stampa il valore letto
li $v0,10 # syscall per Chiudere
syscall # Chiudere
