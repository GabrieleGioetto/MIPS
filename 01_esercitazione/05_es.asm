.data
    str:   .asciiz "Enter a number: "
.text
    .globl main
    .ent main
    main:
        li $v0, 4
        la $a0, str #carico stringa output
        syscall     #Eseguo output
        li $v0, 5
        syscall
        add $t1, $0, $v0
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        add $t2, $0, $v0 #L'input viene messo nel registro $v0
        add $t1, $t1, $t2
        sub $t2, $t1, $t2
        sub $t1, $t1, $t2
        li $v0, 1
        add $a0, $0, $t1
        syscall
        add $a0, $0, $t2
        syscall
        li $v0, 10
        syscall
    .end main