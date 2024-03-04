.data
A:  .word 11, 22, 33, 44, 55
newline: .string "\n"

.text
main:
    la x5, A # load array A
    addi x8, x0, 0 # let x8 = i and set it to 0
    addi x6, x0, 5 # get size of array
    j print_array

print_array:
    bge x8, x6, exit # i >= size
    slli x18, x8, 2 #set x18 to i*4
    add x19, x18, x5 #add i*4 to base address of A and put it to x19
    lw x20, 0(x19) #x20 has A[i]

    addi a0, x0, 1
    add a1, x0, x20
    ecall

    addi a0, x0, 4
    la a1, newline
    ecall

    addi x8, x8, 1 #i++
    j print_array

exit:
    #exit cleanly
    addi a0, x0, 10
    ecall