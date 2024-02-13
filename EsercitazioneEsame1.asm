.data
primo: .asciiz "Enter a number to check whether prime or not:"
secondo: .asciiz "Entered number "
secondoDUE: .asciiz " is a prime number. " 
NONsecondo: .asciiz " Entered number "
NONsecondoDUE: .asciiz " is NOT a prime number."

.text

addi $s0,$s0,0 #num
addi $s1,$s1,0 #i
addi $s2,$s2,0 #flag

li $v0, 4
la $a0,primo
syscall

li $v0,5
syscall
move $s0,$v0

beq $s0,0,Flag
bne $s0,1,noFlag
Flag:
li $s2,1
noFlag:
li $s1,2
div $t0,$s0,2
for:
        bgt $s1,$t0,esciFor #{
	div $s0,$s1
	mfhi $t2
	addi $s1,$s1,1
		bne $t2,0,for
		li $s2,1
	#}
esciFor:
bne $s2,0,ELSE
 	li $v0, 4
 	la $a0, secondo
 	syscall
 	li $v0, 1
 	move $a0,$s0
 	syscall
 	li $v0, 4
 	la $a0, secondoDUE
 	syscall
 	li $v0,10
 	syscall
ELSE:
 	li $v0, 4
 	la $a0, NONsecondo
 	syscall
 	li $v0, 1
 	move $a0,$s0
 	syscall
 	li $v0, 4
 	la $a0, NONsecondoDUE
 	syscall
 	li $v0,10
 	syscall






