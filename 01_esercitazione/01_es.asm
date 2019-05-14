        .data
n1:     .byte 10
n2:     .byte 0x10
n3:     .byte '1' #inizializzo un byte di spazio con il valore '1'
res:    .space 1 #alloco un byte di memoria per la variabile res
        .text
        .globl main
        .ent main
        main:
            lb $t1, n1 #leggo da memoria un byte
            lb $t2, n2
            lb $t3, n3
            add $t0, $0, $t1 # calcoli
            add $t0, $t0, $t3
            sub $t0, $t0, $t2
            sb $t0, res #Salvo su res il valore di $t0
            li $v0, 10 #return
            syscall
        .end main

     
    
