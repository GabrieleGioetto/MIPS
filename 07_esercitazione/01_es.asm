.data
.text
    .globl main
    .ent main
    main:
        li $t0, 15
        li $t1, 16
        li $t2, 17
        li $t3, 18
        li $s0, 223
        li $s1, 224
        li $s2, 225
        li $s3, 226
        subu $sp, $sp, 4
        sw $t0, ($sp)
        subu $sp, $sp, 4
        sw $t1, ($sp)
        subu $sp, $sp, 4
        sw $t2, ($sp)
        subu $sp, $sp, 4
        sw $t3, ($sp)
        subu $sp, $sp, 4
        sw $s0, ($sp)
        subu $sp, $sp, 4
        sw $s1, ($sp)
        subu $sp, $sp, 4
        sw $s2, ($sp)
        subu $sp, $sp, 4
        sw $s3, ($sp)
        jal somma
        lw $t3 16($sp)
        lw $t2 20($sp)
        lw $t1 24($sp)
        lw $t0 28($sp)

        addi $sp, $sp, 32
        move $t4, $v0

        move $a0, $t4
        li $v0, 1
        syscall
        li $v0, 10
        syscall
    .end

    somma:
        move $t0, $0
        move $t1, $0
        move $t2, $0
        move $t3, $0
        move $t4, $0
        move $s0, $0
        move $s1, $0
        move $s2, $0
        move $s3, $0
        move $s4, $0
        lw $t2, 28($sp)
        lw $s2, 12($sp)
        add $v0, $t2, $s2

        lw $s3 ($sp)
        lw $s2 4($sp)
        lw $s1 8($sp)
        lw $s0 12($sp)
        jr $ra

