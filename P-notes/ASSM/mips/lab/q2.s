.data
var_one: .word 0101
var_two: .word 1001
.text
.globl main
main:
lw $t0, var_one
lw $t1, var_two

xor $t0, $t0, $t1
xor $t1, $t0, $t1
xor $t0, $t0, $t1

jr $ra
