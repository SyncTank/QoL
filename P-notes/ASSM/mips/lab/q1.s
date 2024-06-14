.data
num1: .word 2
num2: .word 4
store: .word 0

.text
.globl main
main:
lw $t0, num1 # load num1
lw $t1, num2 # load num2

add $t2, $t0, $t1 # add both integers together

sw $t2, store # store 

jr $ra
