        set_position 60, 0
L03:
        bcc_x L0B
        loop_begin 0
        set_sprite 0
        move 0x29
        set_sprite 1
        move 0x28
        loop_end
L0B:
        loop_begin 0
        set_sprite 0
        move 0x27
        set_sprite 1
        move 0x28
        loop_end
        set_position 90, 0
L14:
        bcc_x L1C
        loop_begin 0
        set_sprite 0
        move 0x29
        set_sprite 1
        move 0x29
        loop_end
L1C:
        loop_begin 0
        set_sprite 0
        move 0x27
        set_sprite 1
        move 0x27
        loop_end
        set_position 150, 0
        jump L14
        set_position 178, 0
        jump L03
        set_position 28, 0
        jump L03
        set_position 212, 0
        jump L03
        set_position 96, 0
        jump L03
        set_position 144, 0
        jump L03
