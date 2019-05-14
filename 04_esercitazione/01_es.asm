.data
    vettore: .space 80
    stampa: .asciiz "\nNumero: "
    DIM = 20
.text
    .globl main
    .ent main
    main:
        #t0, t1 valori
        #t2 contatore indirizzo
        #t3 contatore ciclo
        #t4 var temp
        addi $t2, $zero, 0
        addi $t0, $0, 1
        sw $t0, vettore($t2)
        addi $t2, $t2, 4
        addi $t1, $0, 1
        sw $t1, vettore($t2)
        #Stampa primi 2 valori
        li $v0, 4
        la $a0, stampa
        syscall
        li $v0, 1
        add $a0, $0, $t0
        syscall
        li $v0, 4
        la $a0, stampa
        syscall
        li $v0, 1
        add $a0, $0, $t1
        syscall
        addi $t3, $0, 2
        for:
            add $t4, $0, $t1
            add $t1, $t1, $t0
            add $t0, $0, $t4
            addi $t2, $t2, 4 #Aumento indirizzo
            sw $t1, vettore($t2)
            addi $t3, $t3, 1
            li $v0, 4
            la $a0, stampa
            syscall
            li $v0, 1
            add $a0, $0, $t1
            syscall
            blt $t3, DIM, for

        li $v0, 10
        syscall
    .end