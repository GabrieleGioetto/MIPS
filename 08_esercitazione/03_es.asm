.data
    prezzi:             .word 39, 1880, 2394, 1000, 1590
    scontati:           .space 20
    sconto:             .byte 30
    arrotondamento:     .byte 1
    DIM = 5
.text
    .globl main
    .ent main
    main:
        la $a0, prezzi
        la $a1, scontati
        li $t0, DIM
        lb $t1, sconto
        lb $t2, arrotondamento
        jal calcola_sconto
        la $a1, scontati
        move $t3, $0
        forMain:
            lw $t4, ($a1) # t4 = valore corrente
            li $v0, 1
            move $a0, $t4
            syscall
            addi $a1, $a1, 4 # aumento indirizzo scontati
            addi $t3, $t3, 1
            blt $t3, $t0, forMain
        li $v0, 10
        syscall
    .end

    calcola_sconto:
        move $t3, $0
        addi $t5, $0, 100
        addi $t6, $0, 50
        for:
            lw $t4, ($a0) # t4 = valore corrente
            addi $a0, $a0, 4 # aumento indirizzo
            mul $t9, $t4, $t1 # t9 * sconto
            div $t9, $t5 # t9 / 100
            mfhi $t7 # t7 = resto
            mflo $t8 # t8 = risultato
            beq $t2, $0, fineFor
            blt $t7, $t6, fineFor
                sub $t8, $t8, 1
            fineFor:
            sub $t8, $t4, $t8
            sw $t8, ($a1)
            addi $a1, $a1, 4 # aumento indirizzo scontati
            addi $t3, $t3, 1
            blt $t3, $t0, for
        jr $ra
    
