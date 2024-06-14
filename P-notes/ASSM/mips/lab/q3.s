.data
    prompt: .asciiz "My name is "
    comma: .asciiz ", "
    first_name: .asciiz "Rudiyer "
    last_name: .asciiz "Alvarado"

.text
.globl main
main:
la $a0, prompt # load address string
li $v0, 4 # call for print_string

syscall

la $a0, last_name # load address string
li $v0, 4 # call for print_string

syscall # output to the console

la $a0, comma # load address string
li $v0, 4 # call for print_string

syscall # output to the console

la $a0, first_name # load address string
li $v0, 4 # call for print_string

syscall # output to the console

la $a0, last_name
li $v0, 4
syscall

jr $ra
