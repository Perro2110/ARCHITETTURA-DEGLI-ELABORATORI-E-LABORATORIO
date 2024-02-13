.data
A:.word 21

.text
lw $a0,A
jal nega
move $a0,$v0 
li $v0,1 #per stampare $a0
syscall  #per stampare
addi $v0,$zero,10 # 
syscall # chiudiii

nega:
move $v0,$a0
nor $v0,$0,$v0
addi $v0,$v0,1
jr $ra

