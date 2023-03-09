.data
prompt: .asciiz "Enter a non-negative integer (negative to exit): "
result: .asciiz "The factorial is: "
newline: .asciiz "\n"

.text
.globl main
.globl factorial

# Recursive factorial function
factorial:
    addi $sp, $sp, -8 # reserve space for return address and n
    sw $ra, 4($sp)    # save return address on the stack
    sw $a0, 0($sp)    # save n on the stack

    # base case
    li $v0, 1         # return 1 if n < 1
    blez $a0, factorial_end

    # recursive case
    addi $a0, $a0, -1 # decrement n
    jal factorial     # call factorial with n - 1
    lw $a0, 0($sp)    # load n from the stack
    mul $v0, $v0, $a0 # multiply n by factorial(n - 1)

factorial_end:
    lw $a0, 0($sp)    # load n from the stack
    lw $ra, 4($sp)    # load return address from the stack
    addi $sp, $sp, 8  # deallocate space for return address and n
    jr $ra            # return to caller

# Main program
main:
    li $t0, 1          # initialize loop counter
    li $s0, 0          # initialize factorial result

main_loop:
    # Prompt user for input
    li $v0, 4          # print string
    la $a0, prompt
    syscall

    # Read integer input from user
    li $v0, 5          # read integer
    syscall
    move $a0, $v0      # move input value to argument register

    # Exit loop if input is negative
    bltz $a0, main_end

    # Call factorial function
    jal factorial
    move $s0, $v0      # move factorial result to register s0

    # Print result
    li $v0, 4          # print string
    la $a0, result
    syscall
    li $v0, 1          # print integer
    move $a0, $s0      # move factorial result to argument register
    syscall

    # Print new line
    li $v0, 4     # print string
    la $a0, newline
    syscall

    j main_loop        # repeat loop

main_end:
    li $v0, 10         # exit program
