        bcc_x L08
        set_inversion 1, 0
        set_position 240, 0
        jump L0C
L08:
        set_inversion 0, 0
        set_position 0, 0
L0C:
        loop_begin 15
        move 0x18
        move 0x18
        loop_end
        loop_begin 8
        move 0x17
        move 0x17
        loop_end
        loop_begin 8
        move 0x16
        loop_end
        loop_begin 8
        move 0x15
        loop_end
        set_jump_on_damage L50
        loop_begin 11
        move 0x14
        loop_end
        loop_begin 6
        move 0x13
        loop_end
        loop_begin 6
        move 0x12
        loop_end
        loop_begin 6
        move 0x11
        loop_end
        loop_begin 6
        move 0x10
        loop_end
        loop_begin 6
        move 0x1F
        loop_end
        loop_begin 6
        move 0x1E
        loop_end
        loop_begin 6
        move 0x1D
        loop_end
        loop_begin 6
        move 0x1C
        loop_end
        loop_begin 6
        move 0x1B
        loop_end
        loop_begin 6
        move 0x1A
        loop_end
        loop_begin 6
        move 0x19
        loop_end
        loop_begin 6
        move 0x18
        loop_end
        shoot_aim 0
        loop_begin 6
        move 0x17
        loop_end
        loop_begin 6
        move 0x16
        loop_end
        loop_begin 6
        move 0x15
        loop_end
        loop_begin 0
        move 0x16
        loop_end
L50:
        unset_jump_on_damage
        set_position 120, 220
        loop_begin 4
        move 0x14
        loop_end
        loop_begin 8
        move 0x13
        loop_end
        loop_begin 8
        move 0x12
        loop_end
        loop_begin 8
        move 0x11
        loop_end
        loop_begin 8
        move 0x10
        loop_end
        loop_begin 8
        move 0x1F
        loop_end
        loop_begin 8
        move 0x1E
        loop_end
        loop_begin 8
        move 0x1D
        loop_end
        loop_begin 8
        move 0x1C
        loop_end
        shoot_aim 0
        loop_begin 8
        move 0x1B
        loop_end
        loop_begin 8
        move 0x1A
        loop_end
        loop_begin 8
        move 0x19
        loop_end
        loop_begin 8
        move 0x18
        loop_end
        shoot_aim 0
        loop_begin 8
        move 0x17
        loop_end
        loop_begin 8
        move 0x16
        loop_end
        loop_begin 8
        move 0x15
        loop_end
        loop_begin 0
        move 0x16
        loop_end
