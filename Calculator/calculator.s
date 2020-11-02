.globl __start

.rodata
    op_not_supported_msg: .string "op not supported"
    zero_div_msg: .string "divided by zero"

.text


__start:
    # read A from stdin and store A to s0
    li a0, 5
    ecall
    mv s0, a0

    # read op from stdin and store op to s1
    li a0, 5
    ecall
    mv s1, a0

    # read B from stdin and store B to s2
    li a0, 5
    ecall
    mv s2, a0


    # store 0~3 to register, so as for later beq comparison
    li x5, 0
    li x6, 1
    li x7, 2
    li x28, 3

    # decide which operation
    beq s1, x5, AD # if s1 == 0, go to AD (+)
    beq s1, x6, SU # if s1 == 1, go to SU (-)
    beq s1, x7, MU # if s1 == 2, go to MU (x)
    beq s1, x28, DI # if s1 == 3, got to Div (/)

    # if no branch, then it means op not supported
    j op_not_supported


AD:
    add s3, s0, s2
    j result


SU:
    sub s3, s0, s2
    j result


MU:
    mul s3, s0, s2
    j result


DI:
    beq s2, x5, zero_div # be careful with the case of divide by zero
    div s3, s0, s2
    j result


zero_div:
    li a0, 4
    la a1, zero_div_msg
    ecall

    j return


# print the result in s3
result:
    li a0, 1
    mv a1, s3
    ecall

    j return


op_not_supported:
    li a0, 4
    la a1, op_not_supported_msg
    ecall

    j return


return:
    li a0, 10
    ecall

