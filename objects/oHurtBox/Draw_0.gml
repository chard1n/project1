if(global.debug) {
	draw_set_color(c_gray);
	draw_rectangle(x + x_offset,y + y_offset,x + width + x_offset, y + height + y_offset, false);
	draw_reset();
}