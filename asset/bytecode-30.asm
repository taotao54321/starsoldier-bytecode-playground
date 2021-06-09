        set_part 1
        set_sprite 8
        set_position 80, 0
        jump L40
        set_part 3
        set_sprite 9
        set_position 80, 16
        jump L40
L10:
        set_part 2
        set_sprite 10
        set_position 96, 0
        jump L40
        set_part 4
        set_sprite 11
        set_position 96, 16
        jump L40
        set_part 1
        set_sprite 8
        set_position 144, 0
        jump L40
        set_part 3
        set_sprite 9
        set_position 144, 16
        jump L40
        set_part 2
        set_sprite 10
        set_position 160, 0
        jump L40
        set_part 4
        set_sprite 11
        set_position 160, 16
        jump L40
L40:
        set_jump_on_damage L10
        loop_begin 10
        move 0x08
        move 0x08
        move 0x08
        move 0x08
        loop_end
        loop_begin 10
        shoot_aim 1
        set_sleep_timer 2
        decrement_sprite
        decrement_sprite
        decrement_sprite
        decrement_sprite
        set_sleep_timer 2
        decrement_sprite
        decrement_sprite
        decrement_sprite
        decrement_sprite
        shoot_aim 1
        set_sleep_timer 2
        increment_sprite
        increment_sprite
        increment_sprite
        increment_sprite
        set_sleep_timer 2
        increment_sprite
        increment_sprite
        increment_sprite
        increment_sprite
        loop_end
L60:
        set_jump_on_damage L10
        move 0x00
        jump L60
