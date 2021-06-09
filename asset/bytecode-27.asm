        randomize_x 0xF0
L02:
        set_sprite 0
        set_homing_timer 1
        loop_begin 5
        move 0x08
        loop_end
        set_sprite 1
        set_homing_timer 1
        loop_begin 5
        move 0x08
        loop_end
        set_sprite 2
        set_homing_timer 1
        loop_begin 5
        move 0x08
        loop_end
        shoot_aim 0
        jump L02
