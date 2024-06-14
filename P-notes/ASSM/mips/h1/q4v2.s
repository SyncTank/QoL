.data
v_a: .word 0 
v_b: .word 0
v_c: .word 0

.text
.globl main
main:
la $s0, v_a # initialize a
la $s1, v_b # initialize b
la $s2, v_c # initialize c

sw $zero, 0($s0) # initilize a to 0

li $t1, 10 # load constant for loop t1
lw $t0, 0($s0) # load value a to t0
lw $t2, 0($s1) # load value b to t2
lw $t3, 0($s2) # load value c to t3

loop:
slt $t4, $t0, $t1 # store if t0 == t1 to t3 | a < 10
beq $t4, $zero, leaving # check t3 less comparsion conditional
addi $t0, $t0, 1 # a = a + 1
add $t2, $t2, $t3 # b = b + c
j loop

leaving:
sw $t0, 0($s0) # store a back
sw $t2, 0($s1) # store b back
j exit

exit:
li $v0, 10
syscall
