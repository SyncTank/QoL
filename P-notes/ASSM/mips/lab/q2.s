.data
var_one: .word 2
var_two: .word 3
.text
.globl main
main:
lw $t0, var_one # load variables 2
lw $t1, var_two # 3

xor $t0, $t0, $t1 # store back xor of 2 and 3 
xor $t1, $t0, $t1 # use store xor on t1 to get the past value
xor $t0, $t0, $t1 # use store xor on new past value to get swapped value

jr $ra # exit
