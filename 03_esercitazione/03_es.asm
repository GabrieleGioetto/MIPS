.data
    minuti: .byte 10
    ore: .byte 4
    giorni: .byte 2
    risultato: .word 0
.text
    .globl main
    .ent main
    main:
        lb $t0, minuti
        lb $t1, ore
        lb $t2, giorni
        mul $t2, $t2, 24
        mul $t2, $t2, 60
        mul $t1, $t1, 60
        add $t0, $t0, $t1
        add $t0, $t0, $t2
        add $a0, $0, $t0
        sw $t0, risultato
        li $v0, 1
        syscall
        li $v0, 10
        syscall
    .end