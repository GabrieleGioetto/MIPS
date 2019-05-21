# main:
#     lw $a0, variabile
#     jal incrementa
#     sw $v0, variabile

# incrementa:
#     addi $v0, $a0, 1
#     jr $ra

.data
    msg:    .asciiz "Inserisci numero: "
    newline: .asciiz "\n"

.text
    .globl main
    .ent main
    main:
        la $a0, msg
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $a0, $v0
        move $t4, $a0
        jal stampaTriangolo
        move $a0, $t4
        jal stampaQuadrato
        li $v0, 10
        syscall
    .end

    stampaTriangolo:
        move $t0, $a0 #t0 n righe(lato)
        move $t1, $0 # t1 indice righe
        move $t2, $0 # t2 cont colonne
        move $t3, $0 # t3 indice colonne
        for1Triangolo:
            #STAMPA NUOVA RIGA
            li $v0, 4    
            la $a0, newline 
            syscall
            li $v0, 11 # Carico stampa carattere
            addi $a0, $0, '*'
            move $t3, $0 # t3 indice colonne
            addi $t2, $t2, 1
            addi $t1, $t1, 1
            bgt $t1, $t0, fineStampaTriangolo
            for2Triangolo:
                syscall
                addi $t3, $t3, 1
                bge $t3, $t2, for1Triangolo
                j for2Triangolo
        fineStampaTriangolo:
        jr $ra

    stampaQuadrato:
        move $t0, $a0 #t0 n righe, colonne (lato)
        move $t1, $0 # t1 indice righe
        move $t2, $0 # t2 indice colonne
        for1Quadrato:
            #STAMPA NUOVA RIGA
            li $v0, 4    
            la $a0, newline 
            syscall
            li $v0, 11 # Carico stampa carattere
            addi $a0, $0, '*'
            move $t2, $0 # t2 indice colonne
            addi $t1, $t1, 1
            bgt $t1, $t0, fineStampaQuadrato
            for2Quadrato:
                syscall
                addi $t2, $t2, 1
                bge $t2, $t0, for1Quadrato
                j for2Quadrato
        fineStampaQuadrato:
        jr $ra