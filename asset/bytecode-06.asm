        randomize_x 0xF0
        loop_begin 10
        move 0x18
        move 0x18
        loop_end
        bcc_x L10
L08:
        loop_begin 9
        move 0x09
        move 0x09
        move 0x09
        loop_end
        shoot_aim 0
        jump L08
L10:
        loop_begin 9
        move 0x07
        move 0x07
        move 0x07
        loop_end
        shoot_aim 0
        jump L10
