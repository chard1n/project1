currert_height = 0;
for(i = 0; i < array_length(text); i++) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	
	if(text[i].type == "header") {
		draw_set_font(header_font);
		str_h = string_height("A") * header_extra_padding;
		currert_height += str_h
		draw_text(room_width/2,yy + currert_height, text[i].text);
	} else if(text[i].type == "subheader") {
		draw_set_font(subheader_font);
		str_h = string_height("A") * subheader_extra_padding;
		currert_height += str_h;
		draw_text(room_width/2,yy + currert_height, text[i].text);
	} else if(text[i].type == "body") {
		draw_set_font(body_font);
		str_h = string_height("A") * body_extra_padding;
		currert_height += str_h;
		draw_text(room_width/2,yy + currert_height, text[i].text);
	}
	draw_reset();
}
yy -= 1;