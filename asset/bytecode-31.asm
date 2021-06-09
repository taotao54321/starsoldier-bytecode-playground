        set_health 255
        set_inversion 0, 0
        set_position 12, 4
        set_sprite 12
        loop_begin 14
        move 0x08
        set_sleep_timer 1
        loop_end
        loop_begin 4
        set_sleep_timer 4
        loop_end
        set_health 15
        loop_begin 10
        move 0x25
        move 0x14
        loop_end
        play_sound 9
        loop_begin 14
        move 0x18
        set_sleep_timer 1
        loop_end
        set_part 1
        jump L71
        set_health 255
        set_inversion 1, 0
        set_position 228, 4
        set_sprite 13
        loop_begin 14
        move 0x08
        set_sleep_timer 1
        loop_end
        loop_begin 4
        set_sleep_timer 4
        loop_end
        set_health 15
        loop_begin 10
        move 0x25
        move 0x14
        loop_end
        loop_begin 14
        move 0x18
        set_sleep_timer 1
        loop_end
        set_part 2
        jump L71
        set_health 255
        set_inversion 0, 1
        set_position 12, 228
        set_sprite 14
        loop_begin 14
        move 0x08
        set_sleep_timer 1
        loop_end
        loop_begin 4
        set_sleep_timer 4
        loop_end
        set_health 255
        loop_begin 10
        move 0x25
        move 0x14
        loop_end
        loop_begin 14
        move 0x18
        set_sleep_timer 1
        loop_end
        set_part 3
        jump L71
        set_health 255
        set_inversion 1, 1
        set_position 228, 228
        set_sprite 15
        loop_begin 14
        move 0x08
        set_sleep_timer 1
        loop_end
        loop_begin 4
        set_sleep_timer 4
        loop_end
        set_health 255
        loop_begin 10
        move 0x25
        move 0x14
        loop_end
        loop_begin 14
        move 0x18
        set_sleep_timer 1
        loop_end
        set_part 4
        jump L71
L71:
        set_health 15
        set_inversion 0, 0
        play_sound 9
        loop_begin 6
        shoot_aim 0
        set_sleep_timer 2
        move 0x14
        decrement_sprite
        decrement_sprite
        decrement_sprite
        decrement_sprite
        set_sleep_timer 2
        move 0x14
        decrement_sprite
        decrement_sprite
        decrement_sprite
        decrement_sprite
        shoot_aim 1
        set_sleep_timer 2
        move 0x04
        decrement_sprite
        decrement_sprite
        decrement_sprite
        decrement_sprite
        set_sleep_timer 2
        move 0x0C
        increment_sprite
        increment_sprite
        increment_sprite
        increment_sprite
        shoot_aim 0
        set_sleep_timer 2
        move 0x1C
        increment_sprite
        increment_sprite
        increment_sprite
        increment_sprite
        set_sleep_timer 2
        move 0x2C
        increment_sprite
        increment_sprite
        increment_sprite
        increment_sprite
        shoot_aim 0
        set_sleep_timer 2
        move 0x2C
        decrement_sprite
        decrement_sprite
        decrement_sprite
        decrement_sprite
        set_sleep_timer 2
        move 0x1C
        decrement_sprite
        decrement_sprite
        decrement_sprite
        decrement_sprite
        shoot_aim 1
        set_sleep_timer 2
        move 0x0C
        decrement_sprite
        decrement_sprite
        decrement_sprite
        decrement_sprite
        set_sleep_timer 2
        move 0x04
        increment_sprite
        increment_sprite
        increment_sprite
        increment_sprite
        shoot_aim 0
        set_sleep_timer 2
        move 0x14
        increment_sprite
        increment_sprite
        increment_sprite
        increment_sprite
        set_sleep_timer 2
        move 0x24
        increment_sprite
        increment_sprite
        increment_sprite
        increment_sprite
        loop_end
        restore_music
LC6:
        move 0x18
        jump LC6
        move 0x30
