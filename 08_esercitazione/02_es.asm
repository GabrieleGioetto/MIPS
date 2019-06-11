.data
    anni:       .word 1945, 2008, 1800, 2006, 1748, 1600
    risultato:  .space 6
    lunghezza:  .byte 6
.text
    .globl main
    .ent main
    main:
        la $a0, anni
        la $a1, risultato
        lbu $a2, lunghezza
        jal bisestile
        la $a1, risultato
        move $t0, $0
        cicloStampa:
            lb $t1, ($a1)
            li $v0, 1
            move $a0, $t1 
            syscall # STAMPA
            addi $t0, $t0, 1
            addi $a1, $a1, 1
            blt $t0, $a2, cicloStampa # contatore < 6 salta -> ciclo

    li $v0, 10
    syscall
    .end
    
    bisestile:
        move $t0, $0 # t0: contatore da 0 a 5
        addi $t5, $0, 0 # t5 = 0 costante
        addi $t6, $0, 1 # t6 = 1 costante

        ciclo:
            addi $t7, $0, 100 # t7 = 100
            lw $t2, ($a0) #t2 = anno corrente
            div $t2, $t7
            mfhi $t3 # t3: resto divisione con 100
            addi $t7, $0, 400 # t7 = 400
            div $t2, $t7
            mfhi $t4 # t4: resto divisione con 400
            bne $t3, $0, nonDivPerCento
                beq $t4, $0, annoBisestileTrue
                j annoBisestileFalse
            nonDivPerCento:
                addi $t7, $0, 4 # t7 = 4
                div $t2, $t7
                mfhi $t3 # t3: resto divisione con 4
                beq $t3, $0, annoBisestileTrue
                j annoBisestileFalse
            annoBisestileTrue:
                sb $t6, ($a1)
                j fine
            annoBisestileFalse:
                sb $t5, ($a1)
            fine:

            addi $t0, $t0, 1
            addi $a0, $a0, 4
            addi $a1, $a1, 1
            blt $t0, $a2, ciclo # contatore < 6 salta -> ciclo

        
        jr $ra

