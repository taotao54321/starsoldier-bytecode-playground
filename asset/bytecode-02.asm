L00:
        jump L14
L02:
        loop_begin 6
        move 0x19
        move 0x19
        loop_end
        jump L14
        set_position 8, 0
        set_inversion 1, 0
        jump L00
        set_position 8, 0
        set_inversion 1, 0
        jump L02
L14:
        loop_begin 9
        move 0x19
        move 0x19
        loop_end
        set_sprite 1
        move 0x1A
        move 0x1A
        move 0x1B
        move 0x1B
        move 0x1B
        move 0x1C
        shoot_aim 0
        move 0x1C
        move 0x1C
        move 0x1D
        move 0x1D
        move 0x1D
        move 0x1E
        loop_begin 0
        move 0x1F
        loop_end
