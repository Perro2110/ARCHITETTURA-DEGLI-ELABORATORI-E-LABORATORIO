.data
a: .word 1
b: .word 8
c: .word 10
NON: .asciiz "NO"
BINGO: .asciiz "BINGO "
.text
lw $s0,a
lw $s1,b
lw $s2,c
li $t0,1
li $t1,2
li $t2,4
li $t5,6


beq $s0,$t0,AND1
beq $s0,$t1,AND1
beq $s0,$t2,AND1
bne $s0,$t3,NO
AND1:
li $t0,8
bne $s1,$t0,NO
AND2:
li $t0,10
bne $s2,$t0,NO
addi $v0,$zero,4
la $a0,BINGO
syscall 
j exit

NO:
addi $v0,$zero,4
la $a0,NON
syscall 
exit:
addi $v0,$zero,10
syscall 
