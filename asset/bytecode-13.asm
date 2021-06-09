        set_position 128, 0
        randomize_x 0x30
        jump L0D
        set_position 64, 0
        randomize_x 0x30
        set_inversion 1, 0
L0D:
        set_sprite 0
        loop_begin 10
        move 0x08
        loop_end
        shoot_aim 0
        set_sprite 0
        move 0x00
        move 0x00
        move 0x01
        move 0x01
        move 0x02
        move 0x02
        set_sprite 0
        move 0x03
        move 0x03
        move 0x04
        move 0x04
        move 0x05
        move 0x05
        move 0x06
        move 0x06
        move 0x07
        move 0x07
        set_sprite 0
        loop_begin 10
        move 0x08
        loop_end
        shoot_aim 0
        set_sprite 0
        move 0x00
        move 0x00
        move 0x0F
        move 0x0F
        move 0x0E
        move 0x0E
        set_sprite 0
        move 0x0D
        move 0x0D
        move 0x0C
        move 0x0C
        move 0x0B
        move 0x0B
        move 0x0A
        move 0x0A
        move 0x09
        move 0x09
        jump L0D
