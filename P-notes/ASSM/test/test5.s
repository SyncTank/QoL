.data
str: .asciiz "the answer = "

.text
main:
  li $v0, 4 # sysm call for print_str
  la $a0, str # address of str print
  syscall

  li $v0, 1 # sysm call for print_int
  li $a0, 5 # int to print
  syscall

  li $v0, 10 # halt
  syscall
