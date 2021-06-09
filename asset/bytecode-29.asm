        set_position 0, 112
        set_sprite 1
L04:
        loop_begin 8
        move 0x24
        loop_end
        loop_begin 8
        move 0x14
        loop_end
        shoot_aim 0
L0B:
        move 0x05
        jump L0B
        set_position 240, 112
        set_inversion 1, 0
        set_sprite 0
        jump L04
