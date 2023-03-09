    .data
x1:     .word   3           # x for first evaluation
x2:     .word   2023        # x for second evaluation
six:    .word   6
five:   .word   5
twentyone: .word   21

    .text
    .globl  main

main:
    # Evaluate f(x) for x = 3
    lw      $t0, x1          # Load x into $t0
    lw      $t1, six         # Load 6 into $t1
    lw      $t2, five        # Load 5 into $t2
    lw      $t3, twentyone   # Load 21 into $t3

    mult    $t0, $t1         # Multiply x by 6
    mflo    $t4             
    sub     $t4, $t4, $t2    # Subtract 5 from the result
    mult    $t4, $t0         # Multiply the result by x
    mflo    $t5             
    sub     $t5, $t5, $t3    # Subtract 21 from the result

    li      $v0, 1           # Load system call code for printing integer
    move    $a0, $t5         # Move the result into $a0
    syscall                 # Print the result

    # Evaluate f(x) for x = 2023
    lw      $t0, x2          # Load x into $t0
    lw      $t1, six         # Load 6 into $t1
    lw      $t2, five        # Load 5 into $t2
    lw      $t3, twentyone   # Load 21 into $t3

    mult    $t0, $t1         # Multiply x by 6
    mflo    $t4             
    sub     $t4, $t4, $t2    # Subtract 5 from the result
    mult    $t4, $t0         # Multiply the result by x
    mflo    $t5             
    sub     $t5, $t5, $t3    # Subtract 21 from the result

    li      $v0, 1           # Load system call code for printing integer
    move    $a0, $t5         # Move the result into $a0
    syscall                 # Print the result

    li      $v0, 10          # Load system call code for exit
    syscall                 # Exit the program
