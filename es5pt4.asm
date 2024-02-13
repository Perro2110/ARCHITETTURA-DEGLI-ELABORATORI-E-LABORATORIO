.data
num: .word 1
textG: .asciiz "The value is Greater than 10"
textG1: .asciiz "The value is Greater than 1"
textis: .asciiz "The value is "
.text
lw $s0,num
li $t0,10
li $t1,1

blt $s0,$t0 min
addi $v0,$zero,4
la $a0,textG
syscall 
j exit

min:
beq $s0,$t1,NUM
addi $v0,$zero,4
la $a0,textG1
syscall 
j exit

NUM:
addi $v0,$zero,4
la $a0,textis
syscall 
addi $v0,$zero,1
move $a0,$s0
syscall 
j exit

exit:
addi $v0,$zero,10
syscall 
