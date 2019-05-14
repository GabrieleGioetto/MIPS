.data
    var: .word  0x3FFFFFF0
.text
    .globl main
    .ent main
    main:
        lw $t1, var
        sll $t1, $t1, 1
        add $a0, $0, $t1
        li $v0, 1
        syscall
        addi $t1, $0, 40
        add $t3, $t1, $t2
        add $a0, $0, $t3
        li $v0, 1
        syscall
        li $v0, 10
        syscall
    .end main