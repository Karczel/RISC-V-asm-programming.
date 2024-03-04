.data
arr1: .word 1, 2, 3, 4, 5
arr2: .word 6, 7, 8, 9, 10
a: .string "The dot product is: "
newline: .string "\n"

.text
main: 
    #i , sop=0
    addi x5, x0, 0 #let x5 be sop and set it to 0
    
    addi x8, x0, 0 #let x8 be i and set it to 0
    
    addi x7, x0, 5 # constant value and set it to 5

    # load array addresses
    la x9, arr1
    la x21, arr2

loop1:
    bge x8, x7, exit1
    slli x18, x8, 2 # set x18 to i*4
    add x19, x18, x9 # add i*4 to the base address of arr1 and put it to x19
    lw x23, 0(x19) #x23 has arr1[i]
    
    add x20, x18, x21# add i*4 to the base address of arr2 and put it to x20
    lw x22, 0(x20) #x22 has arr2[i]
    
    mul x6, x23, x22 #a[i] * b[i]
    add x5, x5, x6 #sop += a[i] * b[i]
    addi x8, x8, 1 #i++
    
    j loop1


exit1:
    addi a0, x0, 4
    la a1, a
    ecall

    addi a0, x0, 1
    add a1, x0, x5
    ecall

    addi a0, x0, 10
    ecall