y_offset = 25;
_width = 300;
_height = 25;
_x = display_get_gui_width() - _width - 5;
_y = y_offset;

draw_healthbar(_x, _y, _x + _width, _y + _height, (oHealth / oMaxHealth) * 100, c_black, c_red, c_lime, 0, true, true)
text_align(fa_center, fa_middle);
draw_text(_x + _width / 2, _y - y_offset / 2, $"{oHealth} / {oMaxHealth}");
draw_reset();