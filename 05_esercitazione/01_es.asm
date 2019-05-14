.data
    var: .word 3141592653
.text
    .globl main
    .ent main
    main:
        lw $t0, var
        move $t1, $0
        move $t2, $0
        addi $t4, $0, 10
        for:
            divu $t0, $t4
            mflo $t0
            addi $sp, $sp, -4
            mfhi $t3
            sw $t3, ($sp)
            addi $t1, $t1, 1
            bgt $t0, $0, for
        forStampa:
            lw $t0, ($sp)
            addi $sp, $sp, 4 
            move $a0, $t0
            addi $t2, $t2, 1
            addi $a0, $a0, '0'
            li $v0, 11
            syscall
            blt $t2, $t1, forStampa  
        li $v0, 10
        syscall
    .end
