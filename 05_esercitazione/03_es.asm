.data
    msgA: .asciiz "Inserisci a: "
    msgB: .asciiz "Inserisci b: "
    msgC: .asciiz "Inserisci c: "
.text
    .globl main
    .ent main
    main:
        la $a0, msgA
        li $v0, 4
        syscall
        move $t0, $v0 
        la $a0, msgB
        li $v0, 4
        syscall
        move $t1, $v0 
        la $a0, msgC
        li $v0, 4
        syscall
        move $t2, $v0 
        mul $t1, $t1, $t1
        mul $t0, $t0, 4
        mul $t0, $t0, $t2
        sub $t1, $t1, $t0 # $t1 = b^2 - 4ac
        slt $t3, $t1, $0
        beq $t3, $0, solReali
        #stampa sol non reali
        j fine
        solReali:
        #stampa sol reali
        fine:
        li $v0, 10
        syscall
    .end