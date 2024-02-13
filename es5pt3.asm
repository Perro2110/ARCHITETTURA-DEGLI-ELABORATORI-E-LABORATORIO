.data
x: .word 21

.text
lw $s0,x
li $t0,6
bge $s0,$t0 Xinoe
move $s1,$s0
j exit
Xinoe:
li $s1,6
exit:
addi $v0,$zero,1
move $a0,$s1
syscall 
