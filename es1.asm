.data

h: .word 4
i: .word 4
j: .word 1

.text
li $t0,0x10010000
li $t1,8

sw $t1,0($t0)

lw $s0,0($t0) 
lw $s1,h
lw $s2,i
lw $s3,j



add $t0,$s0,$s1
add $t1,$s2,$s3
sub $s0,$t0,$t1
