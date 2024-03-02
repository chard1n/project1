idx = 0;
if( array_length(global.messages) > 0 ) {
	for(i = array_length(global.messages) - 1; i >= 0; i--) {
		if(global.messages[i].id == self.id) {
			_x = view_wport / 2;
			_y = view_hport - 100 - idx * message_padding;
			draw_set_alpha(alpha);
			draw_set_font(fn_menu); 
			draw_set_color(c_white); 
			draw_text(_x, _y, message_text);
			draw_reset();
		}
		idx++;
	}
}