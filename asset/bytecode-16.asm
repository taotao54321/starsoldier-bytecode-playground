        bcc_x L08
        set_position 240, 0
        set_inversion 1, 0
        jump L0B
L08:
        set_position 0, 0
L0B:
        loop_begin 9
        set_sprite 0
        move 0x08
        move 0x08
        set_sprite 1
        move 0x08
        move 0x08
        loop_end
        loop_begin 8
        set_sprite 0
        move 0x07
        move 0x07
        set_sprite 1
        move 0x07
        move 0x07
        loop_end
        loop_begin 8
        set_sprite 0
        move 0x06
        move 0x06
        set_sprite 1
        move 0x06
        move 0x06
        loop_end
        loop_begin 0
        set_sprite 0
        move 0x05
        move 0x05
        set_sprite 1
        move 0x05
        move 0x05
        loop_end
