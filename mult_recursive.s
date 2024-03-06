.text
main:
    addi a0, x0, 110 # pass the first argument to a0
    addi a1, x0, 50 # pass the second argument to a1
    jal mult
    
    #print_int
    mv a1, a0
    addi a0, x0, 1
    ecall
    
    #exit cleanly
    addi a0, x0, 10
    ecall
    
mult:
    # base case
    # compare a1 with 1, if the two are equal you exit the mult function
    addi t0, x0 , 1
    beq a1, t0, exit_base_case

    # recursive case
    addi sp, sp, -4
    sw ra, 0(sp) # storing the ra value onto the stack
    
    # a + mult(a, b - 1);
    #translating mult(a,b-1)
    addi sp, sp, -4 #make space
    sw a0, 0(sp) # store a0
    addi a1, a1, -1 #b - 1
    jal mult #recursion back
    
    #restore original a0 to t1
    lw t1, 0(sp)
    addi sp, sp, 4
    
    
    #restore return onto stack
    lw ra, 0(sp)
    addi sp, sp, 4
    add a0, a0, t1
    
    #exit recursion
    jr ra
    
exit_base_case:
    #exit recursion
    jr ra