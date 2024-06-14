slt $at, $t5, $t3 # t5 < t3
bne $at, 0, L


slt $at, $t3, $t5 # t3 < t5
beq $at, $0, L
