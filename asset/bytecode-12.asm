        bcc_x L07
        set_position 224, 16
        jump L16
L07:
        set_position 16, 16
L0A:
        set_sprite 1
        loop_begin 4
        move 0x26
        loop_end
        loop_begin 4
        move 0x15
        loop_end
        loop_begin 15
        move 0x14
        move 0x14
        loop_end
        shoot_aim 0
L16:
        set_sprite 0
        loop_begin 4
        move 0x2A
        loop_end
        loop_begin 4
        move 0x1B
        loop_end
        loop_begin 15
        move 0x1C
        move 0x1C
        loop_end
        shoot_aim 0
        jump L0A
