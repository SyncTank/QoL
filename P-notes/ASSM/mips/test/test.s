.data
N:.word 5
X: .word 2
   .word 4
   .word 6
   .word 8
   .word 10
SUM:.word 0

str:
.asciiz "The sum of the array is ="

.text
.globl main
main: lw$s0, N
la $t0, X
and $s1, $s1, $zero
loop: lw $t1, 0($t0)
add $s1, $s1, $t1
addi $t0, $t0, 4
addi $s0, $s0, -1
bne $0, $s0, loop
sw $s1, SUM
li $v0, 10

syscall
.end
