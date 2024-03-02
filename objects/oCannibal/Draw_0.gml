if (keyboard_check(vk_f1)) {
	draw_set_alpha(0.1);
	draw_set_colour(c_white);
	mp_grid_draw(grid_id);
	for (i = 0; i < room_width; i += 64) {
		draw_line_width(i, 0, i, room_height, 3);
	}
	for (j = 0; j < room_width; j += 64) {
		draw_line_width(0, j, room_width, j, 3);
	}
	draw_set_alpha(1);
	if (path_exists(path)) draw_path(path, x, y, true);
}

draw_self();