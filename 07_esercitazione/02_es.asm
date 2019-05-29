.data
    c: .asciiz "Inserisci un numero: "
.text
    .globl main
    .ent main
    main:
        la $a0, c
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $a0, $v0
        jal calcolaSuccessivo
        move $a0, $v0
        li $v0, 1
        syscall
        li $v0,10
        syscall
    .end

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
