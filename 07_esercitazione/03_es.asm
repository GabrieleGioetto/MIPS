.data
    msg: .asciiz "Inserisci un numero: "
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
        jal sequenzaDiColletz
        move $a0, $v0
        li $v0, 1
        syscall

        li $v0,10
        syscall
    .end

    sequenzaDiColletz:
        # PUSH
        subu $sp, $sp, 4
        sw $ra, ($sp) 

        # Metodo
        move $t2, $0
        for:
            addi $t2, $t2, 1
            jal calcolaSuccessivo
            move $a0, $v0
            bne $v0, 1, for

        move $v0, $t2
        # POP
        lw $ra, ($sp)
        add $sp, $sp, 4
        jr $ra

    calcolaSuccessivo:
        addi $t1, $0, 2
        div $a0, $t1
        mfhi $t0
        beq $t0, 0, calcolaSuccPari
            mul $v0, $a0, 3
            addi $v0, $v0, 1
            j finecalcolaSuccessivo
        calcolaSuccPari:
            div $v0, $a0, $t1
        finecalcolaSuccessivo:
        jr $ra
