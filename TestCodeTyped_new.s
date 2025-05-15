    .section .text
    .globl start
start:
    #–– Initialize ––#
    addi x1, x0, 3       # x1 = 3
    addi x2, x0, 6       # x2 = 6

    #–– ADD:   x3 = x1 + x2 = 9
    add  x3, x1, x2

    #–– SUB:   x4 = x2 - x1 = 3
    sub  x4, x2, x1

    #–– AND:   x5 = x1 & x2 = 3&6 = 2   ? non-zero result
    and  x5, x1, x2

    #–– XORI:  x6 = x2 ? 9 = 6?9 = 15
    xori x6, x2, 9

    #–– SW: store x3 (9) at DM[0]
    sw   x3, 0(x0)

    #–– LW: load DM[0] ? x7
    lw   x7, 0(x0)

    #–– BEQ: if x3==x7 (9==9), jump to check_bne
    beq  x3, x7, check_bne

fail1:
    # any mismatch in compute/LW ? loop here
    beq  x0, x0, fail1

check_bne:
    #–– BNE: test x4?x1 (3?3) is FALSE, so fall through
    bne  x4, x1, fail2

    #–– All tests so far passed ? success loop
success:
    beq  x0, x0, success

fail2:
    # unexpected BNE taken ? loop here
    beq  x0, x0, fail2
