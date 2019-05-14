.data
    riga: .word 1, 2, 3, 4
    colonna: .word 1, 2, 3, 4
    newline: .asciiz "\n"
    DIM = 4
.text
    .globl main
    .ent main
    main:
        #t0, t1 contatori
        #t2, t3 indirizzi
        #t4, t5 valori
        #t6 risultato
        add $t0, $0, $0
        forEsterno:
            mul $t2, $t0, 4
            add $t1, $0, $0
            lw $t4, riga($t2)
            forInterno:
                mul $t3, $t1, 4
                addi $t1, $t1, 1
                lw $t5, colonna($t3)
                mul $t6, $t4, $t5
                #STAMPA
                add $a0, $0, $t6
                li $v0, 1
                syscall
                blt $t1, DIM forInterno
            addi $t0, $t0, 1
            #STAMPA NUOVA RIGA
            li $v0, 4    
            la $a0, newline 
            syscall
            blt $t0, DIM forEsterno
        li $v0, 10
        syscall
    .end