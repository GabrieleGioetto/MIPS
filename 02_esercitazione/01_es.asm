.data
    str:    .asciiz "Enter a positive number: "
    strP:    .asciiz "Il numero e pari"
    strD:    .asciiz "Il numero e dispari"

.text
    .globl main
    .ent main
    main:
        la $a0, str
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        add $t0, $v0, $0
        andi $t0, $t0, 1
        addi $t1, $0, 1 #salvo 1 in $t1
        li $v0, 4
        beq $t0, $t1, target # (t0 != t1)
            la $a0, strP
            j done
        target:
            la $a0, strD
        done:
        syscall
        li $v0 10
        syscall  
    .end main