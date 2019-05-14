.data
    str: .asciiz "Inserisci un numero tra 1 e 4: "
    strRis: .asciiz "\nRisultato: "
    opa: .word 2043
    opb: .word 5
    res: .space 4
    tabella: .word salto1, salto2, salto3, salto4
.text
    .globl main
    .ent main
    main:
        la $a0, str
        li $v0, 4
        syscall
        li $v0, 5
        syscall #salva in $v0 il valore input
        add $t0, $v0, $0
        #t2, t3 opa e opb
        lw $t2, opa
        lw $t3, opb
        #SWITCH
        addi $t0, $t0, -1
        sll $t0, $t0, 2 # moltiplico per 4
        lw $t1, tabella($t0)
        jr $t1
    salto1:
        add $t4, $t2, $t3
        j fine
    salto2:
        sub $t4, $t2, $t3
        j fine
    salto3:
        mul $t4, $t2, $t3
        j fine
    salto4:
        div $t4, $t2, $t3
        j fine
    fine:
        sw $t4, res
        la $a0, strRis
        li $v0, 4
        syscall
        add $a0, $0, $t4
        li $v0, 1
        syscall
        li $v0, 10
        syscall
    .end