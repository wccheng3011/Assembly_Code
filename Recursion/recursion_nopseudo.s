.globl __start

.text

__start:
    # read from standard input
    addi a0, zero, 5
    ecall

# n is stored in a0
# store the answer to s0 and jump to "result"

# Date: October 31th drafted, November 2nd 1:20 a.m. finished.
# November 2nd 6:03 finished self-defined test case.
# November 9th found out that I accidently used pseudo instruction, thus revised the version,
# and marked the place where I used pseudo instruction, changed them and tested again.

    jal ra, func

    addi t5, x0, 0
    add s0, a1, t5 # result default in a1, so now put it in s0 as requested

    jal x0, result


func:
    addi sp, sp -16
    sw ra, 0(sp) # store return address
    addi t0, x0, 2
    addi t1, x0, 4
    blt a0, t0, ret_one # if n < 2 return 1
    sw a0, 4(sp) # save our n in stack
    div a0, a0, t0 # perform n / 2
    jal ra, func
    sw a1, 8(sp) # save result of f(n/2) in stack
    lw a0, 4(sp) # restore n
    sw a0, 12(sp) # store n in stack
    div a0, a0, t1 # perform n / 4
    jal ra, func
    lw t3, 8(sp) # restore result of f(n/2)
    lw t4, 12(sp) # restore n in t4
    add a1, a1, t3 # a1 = f(n/4) result, so f(n/4) + f(n/2)
    add a1, a1, t4 # a1 = above + n
    jal x0, done


ret_one:
    addi a1, x0, 1


done:
    lw ra, 0(sp) # restore return address
    addi sp, sp, 16
    jalr x0, 0(ra)


result:
    # prints the result in s0
    addi a0, zero, 1
    addi a1, s0, 0
    ecall

    # ends the program with status code 0
    addi a0, zero, 10
    ecall
