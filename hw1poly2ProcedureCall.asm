# Function to calculate f(x) = (6x - 5)x - 21
# $a0 - x, $v0 - result
calculate_f:
    mult    $a0, $t0    # Multiply x by 6
    mflo    $t0         # Store the low-order 32 bits of the product in $t0
    sub     $t1, $t0, 5 # Subtract 5 from the result in $t0
    mult    $t1, $a0    # Multiply the result by x
    mflo    $v0         # Store the low-order 32 bits of the product in $v0
    sub     $v0, $v0, 21 # Subtract 21 from the result in $v0
    jr      $ra         # Return to place of call

# Main program
main:
    li      $v0, 4      # Load system call code for printing string
    la      $a0, prompt # Load address of prompt string
    syscall             # Print prompt string
    
    loop:
        li      $v0, 5      # Load system call code for reading integer
        syscall             # Read integer into $v0
        beq     $v0, $zero, exit # If x is 0, exit the program
        move    $a0, $v0    # Move x into $a0
        li      $t0, 6      # Load 6 into $t0
        jal     calculate_f # Call calculate_f function
        move    $t2, $v0    # Move result into $t2
        li      $v0, 1      # Load system call code for printing integer
        move    $a0, $t2    # Move the result into $a0
        syscall             # Print the result
        li      $v0, 4      # Load system call code for printing string
        la      $a0, newline # Load address of newline string
        syscall             # Print newline character
        li      $v0, 4      # Load system call code for printing string
        la      $a0, prompt # Load address of prompt string
        syscall             # Print prompt string
        j       loop        # Repeat the loop

    exit:
        li      $v0, 10     # Load system call code for exit
        syscall             # Exit the program

# Data segment
.data
prompt: .asciiz "Enter a value for x: "
newline: .asciiz "\n"
