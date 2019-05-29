.data
    msg:    .asciiz "Inserisci stringa: "
.text
    .globl main
    .ent main
    main:
        la $a0, msg
        li $v0, 4
        syscall
        li $v0, 8
        move $a1, $0 # t2 indirizzo inizio Stringa
        syscall #in $a0 indirizzo inizio stringa, in $a1 lungh stringa
        move $t2, $a0 # t2 indirizzo inizio Stringa
        move $t0, $0 #indice ciclo
        for:
            addi $t2, $t2, 4 #t1 offset indirizzo
            lw $a0, ($t2)
            li $v0, 11
            syscall
            addi $t0, $t0, 1
            blt $t0, $a1, for
            j fineCiclo
        fineCiclo:

        li $v0, 10
        syscall
    .end
    

    convertiMaiuscolo:
        jr $ra