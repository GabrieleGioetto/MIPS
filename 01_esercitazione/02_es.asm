.data
    CONST = ('A' - 'a')
    var1:   .byte 'm'
    var2:   .byte 'i'
    var3:   .byte 'p'
    var4:   .byte 's'
    var5:   .byte 0 #Questa var serve a stoppare la stampa della stringa qui
    #varM:   .byte 'A'
    #varm:   .byte 'a'
.text
    .globl main
    .ent main
    main:
        lb $t0, var1
        lb $t1, var2
        lb $t2, var3
        lb $t3, var4
        lb $t4, var5
        #lb $t5, varM
        #lb $t6, varm
        #sub $t5, $t5, $t6 #Salvo differenze 'A' - 'a'
        add $t0, $t0, CONST
        add $t1, $t1, CONST
        add $t2, $t2, CONST
        add $t3, $t3, CONST
#       sb $t0, 0($a0)		 
#        sb $t1, 1($a0)		 
#        sb $t2, 2($a0)		 
#        sb $t3, 3($a0)		 
        sb $t0, var1    #mi salvo nella variabili i nuovi dati	 
        sb $t1, var2 
        sb $t2, var3		 
        sb $t3, var4	
        la $a0 var1 #carico l'indirizzo di var1 in $a0	 
        li $v0, 4 #carico in v0 il valore 4(print del valore di indirizzo contenuto in $a0)
        syscall
        li $v0, 10
        syscall
    .end main