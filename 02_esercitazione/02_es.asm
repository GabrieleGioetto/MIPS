.data
    str:    .asciiz "Inserisci un numero: "
    strError:    .asciiz "Errore "
.text
    .globl main
    .ent main
    main:
        la $a0, str
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        add $t0, $v0, $0 #A
        la $a0, str
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        add $t1, $v0, $0 #B
        addi $t2, $0, 256
        bgt $t0, $t2, error
        bgt $t1, $t2, error
        
            nor $t2, $t1, $t1
            xor $t3, $t1, $t2
            and $t4, $t0, $t2
            nor $t4, $t4, $t4
            or $t5, $t4, $t3 
            add $a0, $0, $t5
            li $v0, 1 #print int
            syscall
            j done
        error:
            la $a0, strError
            li $v0, 4
            syscall
        done:
        li $v0, 10
        syscall
    .end main