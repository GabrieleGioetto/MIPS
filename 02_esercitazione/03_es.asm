.data
    word0:  .word 17
    word1:  .word 13
    word2:  .word 9
.text
    .globl main
    .ent main
    main:
        lw $t0, word0
        lw $t1, word1
        lw $t2, word2
        bge $t1, $t0, L1 #(bge < ),( bgt > ) #b < a
            #swap(a,b)
            add $t0, $t0, $t1
            sub $t1, $t0, $t1
            sub $t0, $t0, $t1
        L1:
        bge $t2, $t0, L2 # c < a
            #swap(a,c)
            add $t0, $t0, $t2
            sub $t2, $t0, $t2
            sub $t0, $t0, $t2
        L2:
        bge $t2, $t1, done # c < b
            #swap(b,c)
            add $t1, $t1, $t2
            sub $t2, $t1, $t2
            sub $t1, $t1, $t2
        done:
        li $v0, 1
        add $a0, $0, $t0
        syscall
        add $a0, $0, $t1
        syscall
        add $a0, $0, $t2
        syscall
        li $v0, 10
        syscall
    .end main