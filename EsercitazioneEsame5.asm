.data 
x: .space 400 #100*4
y: .space 400 

PrintfUno: .asciiz "Enter the value for n (it should be less than 100): "
pintfDue: .asciiz "Enter the value for x and y:\n" 
printfTre: .asciiz "Enter the value for x["
printfTrebis: .asciiz "Enter the value for y["
printfTrebisbis: .asciiz "]: "
printfQuatro: .asciiz "Final Results are: "
Acapo:"\n"
Space:" "

.text #NB USA I REGISTRI IN MODO ORDINATO !!

li $t7,0 # i USO $t7 PERCHE IL PIU  VICINO TRA GLI "s" gestendolo come tale (un s) 
         # essendo inizializzato nel main non nel for decido di non valutarlo come registro temporaneo

li $s1,0 # n
li $s2,0 # xsum
li $s3,0 # ysum
li $s4,0 #xysum
li $s5,0 #xsqr_sum
li $s6,0 #ysqr_sum 

la $s7,x  
la $s0,y

li $v0,4
la $a0,PrintfUno
syscall

li $v0,5   #scanf n
syscall
move $s1,$v0

li $v0,4
la $a0,pintfDue
syscall

ForUno:
bge $t7,$s1,EsciForUno

	li $v0,4                  #
	la $a0,printfTre        #
	syscall                #
                            #
	move $a0,$t7      #        printf("Enter the value for x[%d]: ", i);           
	li $v0,1           #
	syscall 	     #
			       #
	li $v0,4                #
	la $a0,printfTrebisbis   #
	syscall                   #

li $v0,5   #scanf numero --> scanf("%d", &x[i]);
syscall
move $t0,$v0
mul $t1,$t7,4
add $t2,$t1,$s7
sw $t0,0($t2)

li $v0,4                  # 
la $a0,printfTrebis      #
syscall		        #
		       # printf("Enter the value for y[%d]: ", i);
move $a0,$t7          #                               
li $v0,1               #
syscall                 #
		          #
li $v0,4                  #
la $a0,printfTrebisbis     #
syscall                     #

li $v0,5   #scanf numero --> scanf("%d", &y[i]);
syscall
move $t0,$v0
mul $t1,$t7,4 #potenzialmente inutile
add $t2,$t1,$s0
sw $t0,0($t2)


addi $t7,$t7,1
j ForUno
EsciForUno:

# /* update program variables */ #
li $t7,0

ForDue:
bge $t7,$s1,EsciForDue


mul $t1,$t7,4

add $t2,$t1,$s7
lw $t0,0($t2)
add $s2,$s2,$t0

add $t2,$t1,$s0
lw $t3,0($t2)
add $s3,$s3,$t3

mul $t4,$t0,$t3
add $s4,$s4,$t4

mul $t4,$t0,$t0
add $s5,$s5,$t4

mul $t4,$t3,$t3
add $s6,$s6,$t4

addi $t7,$t7,1
j ForDue

EsciForDue:

li $v0,4                  
la $a0,printfQuatro       
syscall
    
	move $a0,$s2      
	li $v0,1           
	syscall 

	li $v0,4                  
	la $a0,Space     
	syscall   
	
	move $a0,$s3      
	li $v0,1           
	syscall  

	li $v0,4                  
	la $a0,Space     
	syscall   

	move $a0,$s4      
	li $v0,1           
	syscall
	
	li $v0,4                  
	la $a0,Space     
	syscall   
	
	move $a0,$s5      
	li $v0,1           
	syscall  
	
	li $v0,4                  
	la $a0,Space     
	syscall   

	move $a0,$s6      
	li $v0,1           
	syscall                       

	li $v0,4                  
	la $a0,Acapo      
	syscall 

li $v0,10
syscall

