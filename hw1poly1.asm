.data
x1:     .word 3
x2:     .word 2023
six:    .word 6
five:   .word 5
neg21:  .word -21
newline: .asciiz "\n"

.text
.globl main
main:
    # Evaluate f(x) for x = 3
    la $t0, x1           # Load address of x1 into $t0
    lw $s0, 0($t0)       # Load x1 into $s0
    
    lw $t1, six          # Load 6 into $t1
    mul $t2, $s0, $s0    # s0^2
    mul $t3, $t1, $t2    # 6(s0^2)
    
    lw $t1, five         # Load 5 into $t1
    mul $t2, $t1, $s0    # 5s0
    
    sub $t4, $t3, $t2    # 6(s0^2) - 5s0
    
    lw $t1, neg21        # Load -21 into $t1
    add $t5, $t4, $t1    # 6(s0^2) - 5s0 - 21
    
    li $v0, 1
    move $a0, $t5
    syscall
    
    # Print a newline
    li $v0, 4
    la $a0, newline
    syscall
    
    # Evaluate f(x) for x = 2023
    la $t0, x2           # Load address of x2 into $t0
    lw $s0, 0($t0)       # Load x2 into $s0
    
    lw $t1, six          # Load 6 into $t1
    mul $t2, $s0, $s0    # s0^2
    mul $t3, $t1, $t2    # 6(s0^2)
    
    lw $t1, five         # Load 5 into $t1
    mul $t2, $t1, $s0    # 5s0
    
    sub $t4, $t3, $t2    # 6(s0^2) - 5s0
    
    lw $t1, neg21        # Load -21 into $t1
    add $t5, $t4, $t1    # 6(s0^2) - 5s0 - 21
    
    li $v0, 1
    move $a0, $t5
    syscall
    
    # Terminate the program
    li $v0, 10
    syscall
