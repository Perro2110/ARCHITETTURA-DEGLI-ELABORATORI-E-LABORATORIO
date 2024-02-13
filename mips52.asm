.data
enter: .asciiz "Enter a number to check whether prime or not: "
number: .asciiz "Entered number "
true: .asciiz " is a prime number."
false: .asciiz " is NOT a prime number."

.text
# Stampa stringa
li $v0, 4
la $a0, enter
syscall
#Inserisce numero
li $v0, 5
syscall
move $s0, $v0 #sposta numero inserito in $s0
li $s1, 0 #flag = 0
li $s2, 2 #i = 2
li $t0, 0

beq $s0,0,Flag
bne $s0,1,noFlag
Flag:
li $s1,1
noFlag:

div $t7,$s0,2

forloop:
bgt $s2, $t7, if_fine #salta ad if_fine se i>num
div $s0, $s2 # divisione num/i
mfhi $t0 #resto delle divisione in $t0
addi $s2, $s2, 1 #Aggiornamento ++i
bne $t0, $zero, nozero #salta a nozero se num%i != 0
li $s1, 1 # falg = 1
j if_fine

nozero:
j forloop

if_fine:
bne $s1,0, else #salta ad else se flag != 0
#stampa stringa
li $v0, 4
la $a0, number
syscall
#stampa num
li $v0, 1
move $a0, $s0
syscall
#stampa stringa
li $v0, 4
la $a0, true
syscall
j exit

else:
#stampa stringa
li $v0, 4
la $a0, number
syscall
#stampa num
li $v0, 1
move $a0, $s0
syscall
#stampa stringa
li $v0, 4
la $a0, false
syscall

exit:
#return 0
li $v0,10
syscall