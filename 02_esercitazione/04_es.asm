		.data
var:	.word 15
message:.asciiz "Il numero di bit a 1 vale: "

		.text
		.globl main
		.ent main
		
#t0 contiene var
#t1 valore di confronto con and
#t2 contatore del ciclo
#t3 risultato confronto and
#t4 contatore numero di bit a 1

main:
		lhu $t0,var
		li $t1,1
for:
		and $t3,$t0,$t1
		bgt $t3,$0,incrementa
		
		j salta
		incrementa: addi $t4,$t4,1
		
		salta:
		sll $t1,$t1,1
		addi $t2,$t2,1
		blt $t2,16,for

		li $v0,4
		la $a0,message
		syscall
		add $a0,$t4,$0
		li $v0,1
		syscall

		li $v0,10
		syscall
		.end main
		
