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
        add $t0, $0, $0 #accumulatore
        ciclo:
            li $v0, 12 # leggo carattere( lo mette in $v0)
            syscall
            beq $v0, '\n', fineCiclo
            blt $v0, '0', errore
            bgt $v0, '9', errore

            sub $v0, $v0, '0'
            mul $t0, $t0, 10
            add $t0, $t0, $v0

            j ciclo
        errore:
            la $a0, msgErrore # stampa msg errore
            li $v0, 4
            syscall
            j done
        fineCiclo:
            add $a0, $t0, $0
            li $v0, 1
            syscall
        done:
        li $v0, 10
        syscall
    .end