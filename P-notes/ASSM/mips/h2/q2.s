.data #data
x: .word 0 # x
y: .word 0 # y
.text
.globl main
main:
addi $sp, $sp, -4
sw $ra, 0($sp)
lw $a0, x
lw $a1, y
jal diff
lw $ra, 0($sp)
addi $sp, $sp, 4
jr $ra
diff:
sub $v0, $a0, $a1
jr $ra
