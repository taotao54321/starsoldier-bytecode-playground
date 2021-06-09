        randomize_x 0xF0
        loop_begin 10
        move 0x28
        loop_end
        loop_begin 10
        move 0x18
        loop_end
        shoot_aim 0
        set_homing_timer 4
        loop_begin 8
        move 0x14
        move 0x14
        move 0x15
        move 0x15
        move 0x15
        move 0x16
        move 0x18
        move 0x18
        move 0x19
        move 0x19
        move 0x19
        move 0x1A
        move 0x1C
        move 0x1C
        move 0x1D
        move 0x1D
        move 0x1D
        move 0x1E
        move 0x10
        move 0x10
        move 0x11
        move 0x11
        move 0x11
        move 0x12
        shoot_aim 0
        loop_end
L25:
        move 0x08
        jump L25
