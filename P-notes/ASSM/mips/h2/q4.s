.text
.globl main
main:

addi $sp, $sp, -20  # make room on stack for $ra, $s0, $s1, $t0, $a0
sw $ra, 16($sp)     # save $ra
sw $s0, 12($sp)     # save $s0
sw $s1, 8($sp)      # save $s1
sw $t0, 4($sp)      # save $t0
sw $a0, 0($sp)      # save $a0
add $a0, $0, 1 
or $s0, $t0, $a0 
addi $s1, $s0, 8 
jal func 
lw $a0, 0($sp)      # restore $a0
lw $t0, 4($sp)      # restore $t0
lw $s1, 8($sp)      # restore $s1
lw $s0, 12($sp)     # restore $s0
lw $ra, 16($sp)     # restore $ra
addi $sp, $sp, 20   # restore stack pointer
add $s0, $v0, $s0 
and $s1, $s1, $v0 


exit:
jr $ra
