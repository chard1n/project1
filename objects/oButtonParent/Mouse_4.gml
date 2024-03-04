if (mouse_check_button_pressed(mb_left) && !oTransition.is_transitioning) {
    instance_create_layer(0, 0, "Instances", oTransition);
    oTransition.is_transitioning = true;
}