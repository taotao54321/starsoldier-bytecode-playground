L00:
        loop_begin 14
        move 0x1A
        move 0x1A
        loop_end
        set_sprite 1
        loop_begin 6
        move 0x1A
        loop_end
        set_sprite 0
        shoot_aim 0
        set_sprite 1
        loop_begin 6
        move 0x18
        loop_end
        set_sprite 0
        loop_begin 0
        move 0x18
        loop_end
        set_inversion 0, 1
        set_position 232, 239
        jump L00
        set_inversion 1, 0
        set_position 8, 0
        jump L00
        set_inversion 1, 1
        set_position 8, 239
        jump L00
