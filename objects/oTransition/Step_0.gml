if (transition_alpha > 0) {
    transition_alpha -= transition_speed;
} else {
    // Transition complete
    if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
        if (room == rm_menu) { // Check if current room is the menu room
            room_goto_next();
        }
    }
    oTransition.is_transitioning = false; // Reset the flag
}