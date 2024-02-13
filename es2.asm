.data
A: .word 15
B: .word 10
C: .word 7
D: .word 2
E: .word 18
F: .word -3

a: .word 15,10,7,2,18,-3 #vettore per parte 4

stringa: .asciiz "\n il valore �:\n"
stringa1: .asciiz "\n IL VALORE E':\n"
stringa21: .asciiz "\n IL VALORE E' pollo:\n"
.text

###############################################################################
#Parte 1 senza PSEUDOCODICI
###############################################################################

lui $t0,0x1001 #anche addi $t0,$t0,1x10010000 pero no, LEGGI SOTTO PER MAGGIORI INFO
ori $t0,0000 #anche se inutile il mio autismo lo vuole
lw $s1,0($t0)
lw $s2,4($t0)
lw $s3,8($t0)
lw $s4,12($t0)
lw $s5,16($t0)
lw $s6,20($t0)
addi $s7,$zero,0

add $t1,$s1,$s2
sub $t2,$s3,$s4
add $t3,$s5,$s6
sub $t4,$s1,$s3
add $t1,$t1,$t2
add $t1,$t1,$t3
sub $t1,$t1,$t4
add $s7,$t1,$zero

addi $a0,$zero,0x10010018 #ADDI POTREBBE ESSERE VISTA COME PSEUDOISTRUZIONE ESSENDO IL VALORE 0X10... DIVISA POI IN LUI E ORI dovresti fare come righe: 16 17
addi $v0,$zero,4 #sis per stampare stringa 
syscall

add $a0, $s7,$zero # travaso del valore letto in $a0
addi $v0,$zero,1 # syscall per la scrittura di un intero
syscall # stampa il valore letto

###############################################################################
#Parte 2 con pseudoCODICI
###############################################################################
addi $t0,$t0,0x10010000
lw $s1,A
lw $s2,B
lw $s3,C
lw $s4,D
lw $s5,E
lw $s6,F
addi $s7,$zero,0

add $t1,$s1,$s2
sub $t2,$s3,$s4
add $t3,$s5,$s6
sub $t4,$s1,$s3
add $t1,$t1,$t2
add $t1,$t1,$t3
sub $t1,$t1,$t4
add $s7,$t1,$zero

la $a0,stringa
li $v0,4 #sis per stampare 
syscall

add $a0, $s7,$zero # travaso del valore letto in $a0
addi $v0,$zero,1 # syscall per la scrittura di un intero
syscall # stampa il valore letto




###############################################################################
#Parte 3 FUNZIONE:
###############################################################################
lw $s1,A
lw $s2,B
lw $s3,C
lw $s4,D
lw $s5,E
lw $s6,F
addi $s7,$zero,0


addi $a0,$s1,0
addi $a1,$s2,0
addi $a2,$s3,0
addi $a3,$s4,0
                #MANCANO DUE PARAMETRI (a4 E a5 non esistono quindi li metto in sp)
addi $sp,$sp,-8 
sw $s5,0($sp) 
sw $s6,4($sp)# IL PROF OGGI CI HA MOSTRATO IL METODO MISTICO (NON TROPPO COMPLESSO) DI SP MA fp NASCE APPOSTA PERCH� NON USARLO ?
	#(METODO MISTICO)
	# addi $sp,$sp,-8
	# lw $s5,4($sp)    
	# lw $s6,0($sp)
jal do_match
lw $s5,0($sp)
lw $s6,4($sp)
addi $sp,$sp,8  

la $a0,stringa1
li $v0,4 #sis per stampare 
syscall

add $a0, $v1,$zero # travaso del valore della funzione in $a0
addi $v0,$zero,1 # syscall per la output di un intero
syscall # stampa il valore letto


addi $v0,$zero,10 
syscall  #CHIUSURA


do_match:
addi $sp,$sp,-24   #varie pop "ANCHE SE MODIFICO LE COSE POI LE RIMETTO A POSTO IN LINE: 129 "
sw $s1,20($sp)
sw $s2,16($sp)
sw $s3,12($sp)
sw $s4,8($sp)
sw $s5,4($sp)
sw $s6,0($sp)
######################
lw $s5,28($sp)    # PRENDO LE "A" MANCANTI
lw $s6,24($sp)   # IL PROF OGGI CI HA MOSTRATO IL METODO MISTICO (NON TROPPO COMPLESSO) DI SP MA fp NASCE APPOSTA PERCH� NON USARLO ?
	#(METODO MISTICO)
	# lw $s5,28($fp)    
	# lw $s6,24($fp) //24-24=0
add $s1,$a0,$a1
sub $s2,$a2,$a3
add $s3,$s5,$s6
sub $s4,$a0,$a2
add $s1,$s1,$s2
add $s1,$s1,$s3
sub $s1,$s1,$s4
add $v1,$s1,$zero
#######################
lw $s1,20($sp)
lw $s2,16($sp)
lw $s3,12($sp)
lw $s4,8($sp)
lw $s5,4($sp)
lw $s6,0($sp)
######################
addi $sp,$sp,24
jr $ra

###############################################################################
#Parte 4
###############################################################################
la $t0,a
lw $s1,0($t0)
lw $s2,4($t0)
lw $s3,8($t0)
lw $s4,12($t0)
lw $s5,16($t0)
lw $s6,20($t0)

addi $s7,$zero,0
add $t1,$s1,$s2
sub $t2,$s3,$s4
add $t3,$s5,$s6
sub $t4,$s1,$s3
add $t1,$t1,$t2
add $t1,$t1,$t3
sub $t1,$t1,$t4
add $s7,$t1,$zero

la $a0,stringa21
li $v0,4 #sis per stampare 
syscall

add $a0, $s7,$zero # travaso del valore letto in $a0
addi $v0,$zero,1 # syscall per la scrittura di un intero
syscall # stampa il valore letto



