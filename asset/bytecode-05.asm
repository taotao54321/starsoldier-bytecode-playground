        bcc_x L47
        set_position 240, 16
        jump L07
L07:
        set_sprite 1
        loop_begin 10
        move 0x09
        move 0x09
        loop_end
        move 0x1A
        move 0x1A
        move 0x1B
        move 0x1B
        move 0x1B
        move 0x1C
        move 0x1C
        move 0x1C
        move 0x1D
        move 0x1D
        move 0x1D
        move 0x1E
        move 0x1E
        move 0x1E
        move 0x1F
        move 0x1F
        move 0x1F
        move 0x10
        move 0x10
        move 0x10
        move 0x11
        move 0x11
        move 0x11
        move 0x12
        shoot_aim 0
        move 0x12
        move 0x12
        move 0x13
        move 0x13
        move 0x13
        move 0x14
        move 0x14
        move 0x14
        move 0x15
        move 0x15
        move 0x15
        move 0x16
        move 0x16
        move 0x16
        move 0x17
        move 0x17
        move 0x17
        move 0x18
        move 0x18
        move 0x18
        move 0x19
        move 0x19
        move 0x19
        move 0x1A
L3D:
        set_sprite 0
        loop_begin 8
        move 0x0A
        loop_end
        set_sprite 1
        loop_begin 8
        move 0x0A
        loop_end
        jump L3D
L47:
        set_inversion 1, 0
        set_position 0, 16
        jump L07
