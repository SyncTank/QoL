.text
.globl main # s0 = a, s1 = b, s2 = c
main:
  andi $t0, $s0, 0x9B
  nor $t0, $t0, $0
  addi $t0, $t0, -23
  ori $t2, $s1, 0xF8
  add $s2, $t0, $t1

  slt $t0, $s2, $s1
  beq $t0, $0, else

  j exit

else:
  addi $s2, $s1, 1

exit:
  jr $ra
