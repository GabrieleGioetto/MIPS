.data
ora_in:           .byte 12, 47
ora_out:          .byte 18, 14
X:                .byte 1
Y:                .byte 40
        .text
        .globl main
main:             
        la $a0, ora_in   # indirizzo di ora_in
        la $a1, ora_out   # indirizzo di ora_out
        lbu $a2, X
        lbu $a3, Y
        jal costoParcheggio
        move $a0, $v0
        li $v0, 1
        syscall
        li $v0, 10
        syscall
        .end main

costoParcheggio:    
        lb $t0, ($a0) # OraIn
        lb $t1, 4($a0)
        lb $t2, ($a1) # OraOut
        lb $t3, 4($a1)
        mul $t0, $t0, 60
        mul $t2, $t2, 60
        add $t0, $t0, $t1
        add $t2, $t2, $t3
        sub $t5, $t2, $t0
        div $t5, $a3
        mflo $t6 # t6 = minutiTot / 40
        mfhi $t7 # t7 = resto
        mul $t6, $t6, $a2 #t6 = prezzo totale
        beq $t7, $0, fine
            add $t6, $t6, $a2 # aggiungo X euro(1 periodo) se sforo
        fine:
        li $v0, 1
        move $v0, $t6
        jr $ra
