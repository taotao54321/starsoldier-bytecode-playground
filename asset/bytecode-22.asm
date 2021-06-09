        bcc_x L21
        set_position 240, 0
L05:
        set_sprite 1
        loop_begin 10
        move 0x0B
        move 0x0B
        loop_end
        shoot_aim 0
        set_sprite 0
        loop_begin 10
        move 0x05
        move 0x05
        loop_end
        shoot_aim 0
        bcc_y L05
L13:
        set_sprite 1
        loop_begin 15
        move 0x1B
        move 0x1B
        loop_end
        shoot_aim 0
        set_sprite 0
        loop_begin 15
        move 0x15
        move 0x15
        loop_end
        shoot_aim 0
        jump L13
L21:
        set_position 0, 0
L24:
        set_sprite 0
        loop_begin 10
        move 0x05
        move 0x05
        loop_end
        shoot_aim 0
        set_sprite 1
        loop_begin 10
        move 0x0B
        move 0x0B
        loop_end
        shoot_aim 0
        bcc_y L24
L32:
        set_sprite 0
        loop_begin 15
        move 0x15
        move 0x15
        loop_end
        shoot_aim 0
        set_sprite 1
        loop_begin 15
        move 0x1B
        move 0x1B
        loop_end
        shoot_aim 0
        jump L32
