.data
prompt1: .asciiz "Enter value for A: "
prompt2: .asciiz "Enter value for B: "
result: .asciiz "Result: "
newline: .asciiz "\n"
A: .word 0
B: .word 0
C: .word 0
prompt: .asciiz "Do you want to continue? (1: Yes, 0: No) "

.text
.globl main
main:
li $v0, 4           # print prompt1
la $a0, prompt1
syscall

li $v0, 5           # read A
syscall
sw $v0, A

li $v0, 4           # print prompt2
la $a0, prompt2
syscall

li $v0, 5           # read B
syscall
sw $v0, B

lw $t0, A           # load A into $t0
lw $t1, B           # load B into $t1
add $t2, $t0, $t1    # C = A + B
sw $t2, C           # store C

li $v0, 4           # print result
la $a0, result
syscall

lw $a0, C           # load C into $a0
li $v0, 1           # print integer
syscall

li $v0, 4           # print newline
la $a0, newline
syscall

# loop
loop:
li $v0, 4           # print prompt
la $a0, prompt
syscall

li $v0, 5           # read input
syscall
beq $v0, 0, exit    # if input == 0, exit

j main

exit:
li $v0, 10          # exit program
syscall