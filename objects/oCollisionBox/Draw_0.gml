if(global.debug) {
	draw_set_color(c_red);
	draw_rectangle(x,y - height / 2,x + width * facing, y + height / 2, false);
	draw_reset();
}