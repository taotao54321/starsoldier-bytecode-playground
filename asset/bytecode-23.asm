        randomize_x 0xC0
L02:
        move 0x18
        move 0x08
        bcc_y L02
        set_homing_timer 14
        set_sprite 1
        loop_begin 0
        move 0x0B
        loop_end
        randomize_x 0xC0
        set_position 48, 0
L10:
        move 0x18
        move 0x08
        bcc_y L10
        set_homing_timer 14
        set_sprite 2
        loop_begin 0
        move 0x05
        loop_end
