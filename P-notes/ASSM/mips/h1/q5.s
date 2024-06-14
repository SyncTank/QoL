
.text 
.globl main # nori example
main:
ori $t0, $t1, 0xFA34 # t0 = t1 or 0xFA34
nor $t0, $zero, $t0 # not t0

li $v0, 10
syscall
