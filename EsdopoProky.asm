.data
space: .asciiz "Is divisible "
space2: .asciiz "Is not divisible "
.text
main:
li $v0,5
syscall
move $a0,$v0 # S0 = A o y
jal div_6
li $v0, 10
syscall
div_6:
addi $sp, $sp, -8
sw $ra, 4($sp) #ra
sw $a0, 0($sp)
while:
ble $a0,0,exit
sw $a0, 0($sp)
jal div_2
lw $a0, 0($sp)
move $t0,$v0
move $t1,$a0
div $t1,$t1,3
mfhi $t1
#manca un move
bne $t0,1,else
bne $t1,0,else
li $v0, 4
la $a0, space
syscall
lw $a0, 0($sp)
addi $a0,$a0,-1
j while
else:
li $v0, 4
la $a0, space2
syscall
lw $a0, 0($sp)
addi $a0,$a0,-1
j while
exit:
lw $a0, 0($sp)
lw $ra, 4($sp) #ra
addi $sp,$sp,8
jr $ra
div_2:
move $t3,$a0 #x
div $t3,$t3,2
mfhi $t3
bne $t3,0,polloelse
li $v0,1
j polloexit
polloelse:
li $v0,0
polloexit:
jr $ra