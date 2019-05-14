#USO STACK

li $t0, 5
li $t1, 9
#Uso stack per scambiare il valore dei registri (Stack LIFO)

#PUSH t0
# addi $sp, %sp, -4
# sw $t0, ($sp)

# #PUSH t1
# addi $sp, %sp, -4
# sw $t1, ($sp)

# PUSH t0, t1
addi $sp, %sp, -8
sw $t0, 4($sp)
sw $t1, ($sp)

# #POP
# lw $t0, ($sp)
# addi $sp, $sp, 4

# #POP
# lw $t1, ($sp)
# addi $sp, $sp, 4

#POP
lw $t0, ($sp)
lw $t1, 4($sp)
addi $sp, $sp, 8


