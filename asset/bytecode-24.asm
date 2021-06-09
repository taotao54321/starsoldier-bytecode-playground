L00:
        loop_begin 10
        move 0x20
        move 0x10
        move 0x00
        set_sleep_timer 2
        loop_end
        set_sprite 3
        shoot_aim 0
        move 0x10
        move 0x10
        move 0x1F
        move 0x1F
        move 0x1F
        move 0x1E
        move 0x1E
        move 0x1E
        move 0x1D
        move 0x1D
        move 0x1D
        move 0x1C
        move 0x1C
        move 0x1C
        move 0x1B
        move 0x1B
        move 0x1B
        move 0x1A
        move 0x1A
        move 0x1A
        move 0x19
        move 0x19
        move 0x19
        move 0x18
        set_homing_timer 8
        shoot_aim 0
L22:
        move 0x08
        jump L22
        set_position 40, 239
        set_inversion 1, 0
        jump L00
