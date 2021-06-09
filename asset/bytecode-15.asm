        randomize_x 0xF0
        set_jump_on_damage L10
L04:
        set_sprite 0
        loop_begin 15
        move 0x0A
        loop_end
        shoot_aim 0
        set_sprite 1
        loop_begin 15
        move 0x06
        loop_end
        shoot_aim 0
        jump L04
L10:
        unset_jump_on_damage
        bcs_x L17
        loop_begin 0
        move 0x01
        loop_end
L17:
        loop_begin 0
        move 0x0F
        loop_end
