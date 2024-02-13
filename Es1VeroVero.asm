###################################################################################################################################
#                                                                                                   #
# mars è un iss - istruction set simulator                                                          #
#                 --> simula isa non la micro architettura, simula lo stato dell archittettura      #
#                                                                                                   #
####################################################################################################################################

.data #pre_compilazione
.eqv polloAddendo1 $t4
.eqv polloAddendo2 $t1
.eqv polloSomma $t2
POLLAME21: .word 5
POLLAMESTRINGONE: .asciiz "AB"
POLLAME22: .byte 9
POLLAME23: .byte 10,11,12,13

.text #tempo di compilazione
addi polloAddendo1, polloAddendo1, 1 #inizializzazione a 1
addi polloAddendo2, polloAddendo2, 2 #inizializzazione a 2
add polloSomma, polloAddendo2, polloAddendo1 #sommo pollo1 e pollo2 in polloSomma 
li $s0,0x10010000 #o addi $s0,$zero,indirizzo
lb $t0,0($s0)

#un po di syscall
addi $v0,$zero,1 #setto la lettura di un intero (valore in a0) //potevo fare li invece di addi:
#li $v0,1 // è una pseudo istruzione coglione!!!
addi $a0,$zero,42
syscall #esegue v0 --> lettura di un intero (a0)

#STAMPARE A SCHERMO CIO CHE è IN POLLAME21 
la $t0,POLLAME21 #adress di pollame21 //INVECE DI USARE UN: li $t0,0x10010000

lw $a0,0($t0) #potevo fare lw $a0,pollame21
li $v0,1
syscall #esegue v0 --> lettura di un intero (a0)

addi $v0,$zero,10 #setto l'exit
syscall #esegue v0 --> termina il programma 


