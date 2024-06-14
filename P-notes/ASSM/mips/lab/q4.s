.data
mini: .word 3
max: .word 6
result: .word 0

.text
.globl main
main:
lw $s0, mini # load variables
lw $s1, max
la $s2, result 

addi $t1, $s0 , 0 # load starting address
li $t2, 1 # worker one

loop:
slt $t0, $s1, $t1
bne $t0, $zero, exit

sll $t3, $t2, $t1 # set starting power
add $t4, $t4, $t3 # result = result + t3/power

addi $t1, $t1, 1 # add to counter

j loop

exit:
sw $t4, 0($s2) # storing back
jr $ra
