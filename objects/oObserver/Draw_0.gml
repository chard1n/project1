if (global.debug) {
	draw_set_alpha(0.1);
	draw_set_colour(c_white);
	mp_grid_draw(global.grid_id);
	for (i = 0; i < room_width; i += 64) {
		draw_line_width(i, 0, i, room_height, 3);
	}
	for (j = 0; j < room_width; j += 64) {
		draw_line_width(0, j, room_width, j, 3);
	}
	draw_set_alpha(1);
}
