if(global.debug) {
	draw_set_color(c_black);
	draw_rectangle(x_offset, y_offset, x_offset + width, y_offset + height, false);
	draw_set_color(c_white);
	draw_text(x_offset, y_offset + height / 2, inputMessage)
	draw_reset();
}