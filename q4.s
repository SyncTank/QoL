.data
label_a:
label_b:
label_c: 

.text
.globl main
main:
la $s0, label_a
la $s1, label_b
la $s2, label_c
la $s3, 10
lw $t0, 0($s0)
lw $t1, 0($s3)

loop: 
slt $t2, $t0, $t1 # compare s0 to t0, set t1 to 1 if true
beq $t2, $0, exit # check if true, to exit

addi $t0, $t0, 1 # add 1 to a 
sw $t0, 0($s0) # store a/s0

lw $t0, 0($s1) # load b to t0
lw $t1, 0($s2) # load c to t1
add $s1, $s1, $s2 # add s1 and s2 registers store into s1
sw $t0, 0($s1) # store t0 to b/s1

j loop # jump back

exit:
li $v0, 10
syscall
