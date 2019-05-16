.data
    msg: .asciiz "Inserisci stringa: "
    msgPalindroma: .asciiz "Stringa Palindroma "
    msgNonPalindroma: .asciiz "Stringa Non Palindroma "
.text
    .globl main
    .ent main
    main:
        la $a0, msg
        li $v0, 4
        move $t0, $0
        syscall
        for:
            li $v0, 12
            syscall
            beq $v0, '\n', fineCiclo
            addi $sp, $sp, -4
            sw $v0, ($sp)
            addi $t0, $t0, 1
            j for
        fineCiclo:
        addi $t0, $t0, -1
        mul $t1, $t0, 4
        div $t0, $t0, 2
        move $t3, $sp #t3 indirizzo inizio
        add $t3, $t3, $t1
        move $t2, $0
        for2:
            bgt $t2, $t0, palindromo
            lw $t5, ($sp)
            lw $t6, ($t3)
            addi $t3, $t3, -4
            addi $sp, $sp, 4
            bne $t5, $t6, nonPalindromo
            addi $t2, $t2, 1
            j for2
        palindromo:
            la $a0, msgPalindroma
            li $v0, 4
            syscall  
            j fine   
        nonPalindromo:
            la $a0, msgNonPalindroma
            li $v0, 4
            syscall
        fine:     
        li $v0, 10
        syscall
    .end