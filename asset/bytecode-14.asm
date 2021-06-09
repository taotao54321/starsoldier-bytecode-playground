        bcs_x L07
        set_position 168, 0
        jump L0A
L07:
        set_position 88, 0
L0A:
        loop_begin 14
        move 0x18
        loop_end
        set_sprite 1
        shoot_aim 0
        set_sleep_timer 1
        loop_begin 0
        move 0x17
        loop_end
        bcs_x L1A
        set_position 168, 0
        jump L1D
L1A:
        set_position 88, 0
L1D:
        loop_begin 14
        move 0x18
        loop_end
        set_sprite 2
        shoot_aim 0
        set_sleep_timer 1
        loop_begin 0
        move 0x19
        loop_end
        bcs_x L2D
        set_position 168, 0
        jump L30
L2D:
        set_position 88, 0
L30:
        loop_begin 14
        move 0x18
        loop_end
        set_sprite 2
        shoot_aim 0
        set_sleep_timer 1
        loop_begin 0
        move 0x1A
        loop_end
        bcs_x L40
        set_position 168, 0
        jump L43
L40:
        set_position 88, 0
L43:
        loop_begin 14
        move 0x18
        loop_end
        loop_begin 14
        move 0x18
        loop_end
        set_sprite 1
        shoot_aim 0
        set_sleep_timer 1
        loop_begin 0
        move 0x16
        loop_end
