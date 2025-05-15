start:        
        li x1, 5              # x1 = 5
        li x2, 3              # x2 = 3
        add x3, x1, x2        # x3 = 5 + 3 = 8
        sub x4, x1, x2        # x4 = 5 - 3 = 2
        and x5, x1, x2        # x5 = 5 & 3 = 1
        addi x6, x1, 7        # x6 = 5 + 7 = 12
        xori x7, x1, 0xF      # x7 = 5 ^ 15 = 10

        xori x8, x1, 0xA         # x8 = address to store to
        sw x3, 0(x8)          # mem[0x1000] = x3 = 8
        lw x9, 0(x8)          # x9 = mem[0x1000] = 8

        beq x4, x3, label1    # should jump (8 == 8)
        li x10, 0xBAD         # shouldn’t run

label1: bne x3, x4, label2    # should jump (8 != 2)
        li x11, 0xBAD         # shouldn’t run

label2:
    li x1, 77
    beq x2, x2 start