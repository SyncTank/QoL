
# c = (~(a & 0xFF)) + 1 + (b & 0xFF);
# a = s0, b = s1, c = s2
.text
.globl main
main:
lui $t0, 0xFF # result to a && b
lui $s0, 0x88
lui $s1, 0x33

andi $t1, $s0, 0xFF
nor $t1, $t1, $zero
addiu $t1, $t1, 1

andi $t2, $s1, 0xFF

addu $s2, $t2, $t1

li $v0, 10
syscall
