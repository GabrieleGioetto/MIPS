.data
    DIM = 4
    message: .asciiz "Inserisci un numero: "
    message2: .asciiz "\nMedia: "
.text
    .globl main
    .ent main
    #t0 :contatore
    #t1 :somma
    main:
        add $t0, $0, $0
        ciclo:
            beq $t0, DIM, fineCiclo
            addi $t0, $t0, 1
            la $a0, message
            li $v0, 4
            syscall
            li $v0, 5
            syscall
            add $t1, $t1, $v0 
            j ciclo
        fineCiclo:
        la $a0, message2
        li $v0, 4
        syscall
        div $t1, $t1, DIM
        add $a0, $0, $t1
        li $v0, 1
        syscall
        li $v0, 10
        syscall
    .end