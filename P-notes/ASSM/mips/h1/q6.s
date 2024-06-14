
main:
slt $t0, $s1, $s0 # t = h < g
bne $t0, $zero, else

addi $s0, $0, 0 # g = 0

j exit

else:
addi $s1, $0, 0 # h = 0

exit:
jr $ra


# if g less than or equal to h run if otherwise run else
# s1 is less than s0 (h < g)
