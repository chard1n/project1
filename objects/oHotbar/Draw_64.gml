if(!shown) {
	return;
}
draw_rectangle_color(x_offset - padding, y_offset - padding, x_offset + width + padding, y_offset + height + padding, bgd_color, bgd_color, bgd_color, bgd_color, false);

inventory_items = oInventory.inventory.item_get();
for(i = 45; i < array_length(inventory_items); i++) {
	if(i > 53) continue;
	
	box_x = i%45 * (box_padding + box_size) + x_offset + box_padding / 2;
	box_y = y_offset;
	
	if(i%45 == selected_slot) {
		box_y += selected_slot_yoffset;
		draw_rectangle_color(box_x - selected_slot_padding, box_y - selected_slot_padding, box_x + box_size + selected_slot_padding, box_y + box_size + selected_slot_padding, selected_bgd_color, selected_bgd_color, selected_bgd_color, selected_bgd_color, false);
	}
	
	draw_sprite(sHotbar_Box, 0, box_x, box_y);
	
		
	// Check if selected slot has an item, if so, make the player hold it
	// If not, set players holding_name and holding_sprite to noone
	if(i%45 == selected_slot) {
		if(inventory_items[i] != noone) { // Has item
			oPlayer.holding_name = inventory_items[i].name;
			oPlayer.holding_sprite = inventory_items[i].sprite;
		} else { // Doesn't have item
			oPlayer.holding_name = noone;
			oPlayer.holding_sprite = noone;
		}
	}
	
	if(inventory_items[i] == noone) continue;

	draw_set(#232323, 1);
	draw_circle(
		box_x + box_size - padding / 2,
		box_y + box_size,
		10,
		false
	);
			
	draw_set(c_white, 1);
	text_align(fa_center, fa_middle);
			
	draw_text(
		box_x + box_size - padding / 2,
		box_y + box_size,
		inventory_items[i].quantity
	);

	draw_sprite(inventory_items[i].sprite, 0, box_x, box_y);

}

