.data
    messaggio: .asciiz "Inserisci un numero: "
    msgErrore: .asciiz "\nErrore "

.text
    .globl main
    .ent main
    main:
        la $a0, messaggio
        li $v0, 4
        syscall
        ciclo:
            li $v0, 12 # leggo carattere( lo mette in $v0)
            syscall
            beq $v0, '\n', fineCiclo
            blt $v0, '0', errore
            bgt $v0, '9', errore
            j ciclo
        errore:
            la $a0, msgErrore # stampa msg errore
            li $v0, 4
            syscall
        fineCiclo:
        li $v0, 10
        syscall
    .end