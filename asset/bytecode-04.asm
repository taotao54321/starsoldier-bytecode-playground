        set_jump_on_damage L14
        randomize_x 0xF0
L04:
        loop_begin 15
        move 0x08
        loop_end
        shoot_aim 0
        loop_begin 15
        move 0x04
        loop_end
        loop_begin 15
        move 0x08
        loop_end
        shoot_aim 0
        loop_begin 15
        move 0x0C
        loop_end
        jump L04
L14:
        set_jump_on_damage L18
        jump L04
L18:
        unset_jump_on_damage
L1A:
        move 0x00
        jump L1A
