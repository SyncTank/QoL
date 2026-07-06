.text
.globl main
main:
addi $a0, $0, 1 # add 1 to 0 store a0
addi $a1, $0, 2 # add 2 to 0 store a1
jal func # call
add $s0, $v0, $0 # add v0 to 0 store s0

li $v0, 10 # end
syscall

func:
addi $sp, $sp, -8 # make space on stack
or $t0, $a0, $a1 # or a0 to a1 store t0
addi $s0, $t0, 4  # add t0 to 4 store s0
sw $ra, 0($sp) # save ra on stack
jal func2 # call
and $s1, $0, $v0 # and 0 to v0 store s1
add $v0, $v0, $s1 # add v0 to s1 store v0
lw $ra, 0($sp) # restore ra from stack
addi $sp, $sp, 8 # dellocate stack space
jr $ra # return ra

func2:
addi $t0, $0, 0 # add 0 to 0 store t0
addi $v0, $t0, 4 # add t0 to 4 store v0
jr $ra
