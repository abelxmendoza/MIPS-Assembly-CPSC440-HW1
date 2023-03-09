# Data segment
.data
promptA: .asciiz "Enter the value of A: "
promptB: .asciiz "Enter the value of B: "
result: .asciiz "The result is: "

# Memory variables
A: .word 0
B: .word 0
C: .word 0

# Text segment
.text
main:
    # Prompt the user to enter A and B
    li $v0, 4
    la $a0, promptA
    syscall
    
    li $v0, 5
    syscall
    sw $v0, A
    
    li $v0, 4
    la $a0, promptB
    syscall
    
    li $v0, 5
    syscall
    sw $v0, B
    
    # Add A and B and store the result in C
    lw $t0, A
    lw $t1, B
    addmem $t2, $t0, $t1
    sw $t2, C
    
    # Print the result
    li $v0, 4
    la $a0, result
    syscall
    
    lw $a0, C
    li $v0, 1
    syscall
    
    # Prompt the user to continue or exit
    li $v0, 4
    la $a0, "Do you want to continue? (y/n): "
    syscall
    
    li $v0, 12
    syscall
    
    beq $v0, 110, exit # 110 is ASCII code for 'n'
    j main
    
exit:
    li $v0, 10
    syscall
