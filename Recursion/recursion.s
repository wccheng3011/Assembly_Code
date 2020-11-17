.globl __start

.text

__start:
    # read from standard input
    addi a0, zero, 5
    ecall

    jal func # go to recursive function

    li t5, 0
    add s0, a1, t5 # result default in a1, so now put it in s0 as requested

    j result # final step


func:
    addi sp, sp -16
    sw ra, 0(sp) # store return address
    li t0, 2 # set t0 to be 2
    li t1, 4 # set t1 to be 4
    blt a0, t0, ret_one # if n < 2 return 1
    sw a0, 4(sp) # save our n in stack
    div a0, a0, t0 # perform n / 2
    jal func # call f(n/2)
    sw a1, 8(sp) # save result of f(n/2) in stack
    lw a0, 4(sp) # restore n
    sw a0, 12(sp) # store n in stack
    div a0, a0, t1 # perform n / 4
    jal func # call f(n/4)
    lw t3, 8(sp) # restore result of f(n/2)
    lw t4, 12(sp) # restore n in t4
    add a1, a1, t3 # a1 = f(n/4) result, so f(n/4) + f(n/2)
    add a1, a1, t4 # a1 = above + n
    j done


ret_one:
    li a1, 1


done:
    lw ra, 0(sp) # restore return address
    addi sp, sp, 16
    jr ra


result:
    # prints the result in s0
    addi a0, zero, 1
    addi a1, s0, 0
    ecall

    # ends the program with status code 0
    addi a0, zero, 10
    ecall
