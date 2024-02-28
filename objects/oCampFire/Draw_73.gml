// Draw light after the day/night draw so lighting is not changed
if(strength > 0) {
	flicker = random_range(0,2);
	draw_set_alpha(0.2);
	c = make_color_rgb(255,255,150);
	draw_set_circle_precision(25)
	draw_circle_color(x + sprite_width / 2, y + sprite_height / 2, strength + flicker, c, c, false)
	draw_reset();
}

if(!has_been_interacted && collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x_center + x_message_offset, y_center + y_message_offset, interact_message);
}