        bcc_x L08
        set_position 240, 239
        set_inversion 0, 0
        jump L0C
L08:
        set_position 0, 223
        set_inversion 1, 0
L0C:
        loop_begin 10
        move 0x1F
        move 0x1F
        loop_end
        loop_begin 10
        move 0x10
        move 0x10
        loop_end
        loop_begin 10
        move 0x0B
        loop_end
        loop_begin 10
        set_homing_timer 2
        set_sprite 1
        shoot_aim 0
        set_sleep_timer 1
        set_sprite 0
        set_sleep_timer 1
        loop_end
        loop_begin 15
        move 0x00
        loop_end
        shoot_aim 0
        loop_begin 0
        move 0x00
        loop_end
