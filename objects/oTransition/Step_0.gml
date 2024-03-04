if (transition_alpha > 0) {
    transition_alpha -= transition_speed;
} else {
    // Transition complete, wait for user input to start game
    if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
        room_goto_next();
    }
}