.data
stringa: .asciiz "Ciao mondo\n"
stringaPollosa: .space 8


.text

#Syscall «output stringa»

la $a0,stringa
li $v0,4 #sis per stampare 
syscall

#Syscall «leggi intero»

li $v0, 5 # Carichiamo il codice della syscall in $v0 inupèut
syscall # Invochiamo la syscall con codice 5
                                   # Valore va in $v0
add $a0, $v0, $zero # travaso del valore letto in $a0
li $v0, 1 # syscall per la scrittura di un intero
syscall # stampa il valore letto

# Syscall «leggi stringa»

li $v0,8 # Carichiamo il codice della syscall in $v0
la $a0, stringaPollosa # Indirizzo del buffer
li $a1, 8 # numero di caratteri da leggere (più uno)
Syscall # Invochiamo la syscall con codice 8
li $v0, 4 # stampo la stringa letta
Syscall

