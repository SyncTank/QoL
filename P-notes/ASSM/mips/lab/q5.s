.data
numOne: .word 3
numTwo: .word 100

.text
.globl main
main:
lw $t0, numOne # load variables
lw $t1, numTwo

if:
slt $t3, $t0, $t1 # compare if numOne < numTwo
beq $t3, $zero, else # if not true jump to else, otherwise continue

move $t2, $t1 # t2 is set to t1
j exit # exit gracefully

else:
move $t2, $t0 # t2 is set to t0

exit:
jr $ra
