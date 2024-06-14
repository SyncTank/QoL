.data
n: .word 20
base_two: .word 2
result: .word 0

.text
.globl main
main:
la $s0, n # load variables
la $s1, base_two
la $s2, result

lw $t0, 0($s0) # load words to temp
lw $t3, 0($s1)

addi $t1, $t0, 1 # n + 1

mult $t0, $t1 # n * t1
mflo $t2 # move lower 32 bits to t2

div $t2, $t3 # t2 / t3
mflo $t2 # move LO 32 bits to t2

sw $t2, 0($s2) # store to s2

exit:
jr $ra
