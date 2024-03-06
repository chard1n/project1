continue_message = $"Click {keytostring(global.confirm_key)} to conitue";

draw_text(x + width / 2 - string_width(continue_message) / 2,y + continue_message_y_offset, continue_message);

draw_sprite_stretched(sprite_index, 0, x, y, width, height);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(text_font);
draw_set_color(text_color);
type(x + text_x, y + text_y, text, text_progress, text_width);
draw_reset();

draw_set_halign(fa_right);
draw_text(x + width - padding / 2, y, $"{current_action + 1}/{array_length(actions)}");
draw_reset();
