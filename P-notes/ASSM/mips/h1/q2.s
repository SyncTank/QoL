.text
.globl main
main: 
addi $a0, $0, 1 # add 1 to 0 store a0
addi $a1, $0, 2 # add 2 to 0 store a1
jal func  # func call
add $s0, $v0, $0 # add v0 to 0 store s0

li $v0, 10 # safetly exit
syscall

func:
or $t0, $a0, $a1 # or a0 to a1 store t0
addi $s0, $t0, 4 # add t0 to 4 store s0
add $v0, $t0, $s0 # add t0 to s0 store v0 
jr $ra # return 
