.text
.globl main
main:
  lui $s2, 0xFEDC
  ori $s2, $s2, 0x4321
  addi $t0, $0, 4
  srlv $s1, $s2, $t0
  add $t3, $s1, $0 

  jr $ra
