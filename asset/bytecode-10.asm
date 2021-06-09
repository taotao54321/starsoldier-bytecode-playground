        set_position 192, 0
        randomize_x 0x30
        set_sprite 1
L06:
        loop_begin 13
        move 0x19
        move 0x19
        loop_end
        loop_begin 3
        set_sprite 0
        set_sleep_timer 1
        shoot_aim 0
        set_sprite 1
        set_sleep_timer 1
        set_sprite 2
        set_sleep_timer 1
        shoot_aim 0
        set_sprite 3
        set_sleep_timer 1
        loop_end
L16:
        move 0x21
        jump L16
        set_position 192, 0
        randomize_x 0x30
        set_sprite 1
L1F:
        loop_begin 9
        move 0x1A
        move 0x1A
        move 0x1A
        loop_end
        loop_begin 6
        set_sprite 0
        set_sleep_timer 1
        shoot_aim 0
        set_sprite 1
        set_sleep_timer 1
        set_sprite 2
        set_sleep_timer 1
        shoot_aim 0
        set_sprite 3
        set_sleep_timer 1
        loop_end
L30:
        move 0x22
        jump L30
        set_inversion 1, 0
        set_position 0, 0
        randomize_x 0x30
        jump L06
        set_inversion 1, 0
        set_position 0, 0
        randomize_x 0x30
        jump L1F
