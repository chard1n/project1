draw_set_color(c_black);
draw_set_alpha(transition_alpha/255);
draw_rectangle(0, 0, room_width, room_height, false);
draw_reset();

if (transition_alpha <= 0) {
    draw_set_color(c_white);
    draw_text(room_width/2 - 125, room_height/2 - 220, "Press SPACE or Click to Start");
	draw_reset();
}