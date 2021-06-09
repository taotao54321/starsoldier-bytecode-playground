        bcc_x L08
        set_inversion 1, 1
        set_position 240, 238
        jump L0C
L08:
        set_inversion 0, 1
        set_position 0, 238
L0C:
        set_sprite 0
        loop_begin 10
        move 0x18
        move 0x18
        loop_end
        set_sprite 1
        loop_begin 10
        move 0x18
        move 0x18
        loop_end
        shoot_aim 0
        set_sprite 0
        loop_begin 8
        move 0x17
        loop_end
        set_sprite 1
        loop_begin 8
        move 0x16
        loop_end
        shoot_aim 0
        set_sprite 0
        loop_begin 8
        move 0x15
        loop_end
        set_sprite 1
        loop_begin 8
        move 0x14
        move 0x14
        loop_end
        set_sprite 0
        loop_begin 9
        move 0x13
        loop_end
        set_sprite 1
        loop_begin 9
        move 0x12
        loop_end
        set_sprite 0
        loop_begin 9
        move 0x11
        loop_end
        set_sprite 1
        loop_begin 15
        move 0x10
        move 0x10
        loop_end
        shoot_aim 0
        set_sprite 0
        loop_begin 0
        move 0x0D
        move 0x0D
        loop_end
