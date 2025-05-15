start:
    #–– Initialize ––#
    addi x1, x0, 5       # x1 = 5
    addi x2, x0, 10      # x2 = 10

    #–– ADD:  x3 = x1 + x2 ? 15
    add  x3, x1, x2

    #–– SUB:  x4 = x2 - x1 ? 5
    sub  x4, x2, x1

    #–– AND:  x5 = x1 & x2 ? 0
    and  x5, x1, x2

    #–– XORI: x6 = x2 ? 15 ?  10?15=5
    xori x6, x2, 15

    #–– SW: store x3 @ DM[0]
    sw   x3, 0(x0)

    #–– LW: load DM[0] ? x7
    lw   x7, 0(x0)

    #–– BEQ: if x3==x7 OK ? jump to BNE check
    beq  x3, x7, check_bne

fail1:
    # any mismatch so far: loop forever here
    beq  x0, x0, fail1

check_bne:
    #–– BNE: test that x4?x1 is FALSE (since both are 5)
    bne  x4, x1, fail2

    # if BNE was mistakenly taken, we’d be at fail2; 
    # otherwise fall through here and continue

continue_tests:
    #–– All tests passed!
success:
    beq  x0, x0, success

fail2:
    # BNE mis-behavior traps here
    beq  x0, x0, fail2