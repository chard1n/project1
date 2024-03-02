draw_self();

if(!has_been_interacted && collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x_center + x_message_offset, y_center + y_message_offset, interact_message);
}