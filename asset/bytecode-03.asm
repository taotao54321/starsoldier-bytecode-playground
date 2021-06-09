L00:
        loop_begin 8
        set_sprite 0
        move 0x00
        set_sleep_timer 1
        set_sprite 1
        move 0x00
        set_sleep_timer 1
        loop_end
        set_sprite 2
L09:
        shoot_aim 0
        loop_begin 10
        move 0x12
        loop_end
        jump L09
        loop_begin 8
        set_sprite 0
        move 0x00
        set_sprite 1
        move 0x00
        loop_end
        loop_begin 8
        set_sprite 0
        move 0x00
        set_sprite 1
        move 0x00
        loop_end
        loop_begin 8
        set_sprite 0
        move 0x00
        set_sprite 1
        move 0x00
        loop_end
        loop_begin 8
        set_sprite 0
        move 0x00
        set_sprite 1
        move 0x00
        loop_end
        jump L00
