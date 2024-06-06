.text
.globl main
main:
lui $s0, 0xFEDC # store 0xfedc into s0/r16 
ori $s0, $s0, 0x4321 # combine s0 with s0 + 0x4321 zero extended
addi $t0, $0, 8 # store 8 into $t0 using $0 to pass value
srav $s1, $s0, $t0 # shift right arithmetic store into $s1 <= $s0 >>> $s0 
# srav is that the sign bit is replicated and lsb it thrown
srlv $t2, $s0, 16 # shfit right logically with 0 in msb 16 bit
srlv $t3, $s0, 8 # shfit right logically with 0 in msb 8 bit


li $v0, 10
syscall

