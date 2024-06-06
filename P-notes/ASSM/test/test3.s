#sameple example 'add two numbers'

.text # text sect
.globl main # make spim call main

main: la $t0, value # load address value
      lw $t1, 4($t0) # load word value
      lw $t2, 12($t0) # load word 4
      add $t3, $t1, $t2 # add two numbers
      sw $t3, 8($t0) # store word
      li $v0, 10 # syscall to exit from main only

syscall # ends execution
.end

.data # data section refernced by 4s so 0, 4, 8, etc
value: .word 10, 20, 0, 13 # data stored in .word
