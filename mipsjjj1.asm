.data
arr: .word 12 121 1322 522 6
length: .word 5
space: .asciiz " "

.text
la $a0, arr
lw $a1, length
jal insertionsort
la $a0, arr
lw $a1, length
jal printarray
li $v0, 10
syscall


insertionsort: 
addi $sp, $sp, -12
sw $s0, 8($sp)
sw $s1, 4($sp)
sw $s2, 0($sp)
		# usero s0, s1, s2
li $s0, 1 # i 
forloop:
beq $s0, $a1, escifor
sll $t0, $s0, 2 # t0=i+1
add $t0, $t0, $a0 #address in t0=array[i]
lw $s1, 0($t0) #arr[i] in key

addi $s2, $s0, -1 # j in s2
whileloop:
blt $s2, $zero, esciwhile
sll $t0, $s2, 2 # j+1
add $t0, $t0, $a0 
lw $t0, 0($t0) #t0=arr[j]
ble $t0, $s1, esciwhile
addi $t1, $s2, 1
sll $t1, $t1, 2
add $t1, $t1, $a0
sw $t0, 0($t1) #t0 indirizzo
addi $s2, $s2, -1
j whileloop
esciwhile:
addi $t0, $s2, 1
sll $t0, $t0, 2
add $t0, $t0, $a0
sw $s1, 0($t0)
addi $s0, $s0, 1
j forloop
escifor:
lw $s2, 0($sp)
lw $s1, 4($sp)
lw $s0, 8($sp)
addi $sp, $sp, 12
jr $ra

printarray:
addi $sp, $sp, -4
sw $s0, 0($sp)
li $s0, 0
move $t1, $a0
forprint:
beq $s0, $a1, esciprint
sll $t0, $s0, 2
add $t0, $t0, $t1
lw $a0, 0($t0)
li $v0, 1
syscall
li $v0, 4
la $a0, space
syscall
addi $s0, $s0, 1
j forprint
esciprint:
lw $s0, 0($sp)
addi $sp, $sp, 4
jr $ra
