.data
a: .word 1, 2, 3, 4, 5 
b: .word 6, 7, 8, 9, 10
q: .string "The dot product is: "
newline: .string "\n"

.text
main:
    # load array
    la t0, a #load a to t0
    la t1, b #load b to t1
    addi a0, x0, 5 #const size value 5
    addi a1, x0, 0 #place result onto a1
    jal dot_product_recursive
    
    
    
    mv s5, a1
    
    addi a0, x0, 4
    la a1, q
    ecall
    
    addi a0, x0, 1
    mv a1, s5  #result
    ecall
    
    addi a0, x0, 10
    ecall

dot_product_recursive:

    #base case
    addi t4, x0, 1 # const value 1
    beq a0, t4, else #if size == 1
    
    #recursive case
    addi sp, sp, -4
    sw ra, 0(sp) #store ra to stack
    
    #a[0]*b[0] + dot_product_recursive(a+1, b+1, size-1);
    #translating dot_product_recursive(a+1, b+1, size-1)
    addi sp, sp, -8 #make space
    #use a[0], b[0] ,save to stack
    sw t0, 0(sp)
    sw t1, 4(sp)
    #a+1 ,b+1 ,size-1
    addi t0,t0,4 #a+1
    addi t1,t1,4 #b+1
    addi a0,a0,-1 #size-1
    jal dot_product_recursive
    
    #restore values
    
    #get [0]
    lw t0, 0(sp)
    lw t1, 4(sp)
    addi sp, sp, 8
    lw s0, 0(t0)
    lw s1, 0(t1)
    
    #problem, first b called is wrong by 1 index
    
    #a[0]*b[0] + dot_product_recursive(a+1, b+1, size-1);
    mul t5, s0, s1
    add a1, a1, t5
    
    #restore return
    lw ra, 0(sp)
    addi sp,sp,4
    
    jr ra
    
else:
    lw s0, 0(t0)
    lw s1, 0(t1)
    mul t5, s0, s1
    add a1,a1,t5
    
    jr ra
