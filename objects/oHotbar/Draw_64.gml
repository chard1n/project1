if(!shown) {
	return;
}

// 45 - 53

inventory_items = oInventory.inventory.item_get();
for(i = 0; i < array_length(inventory_items); i++) {
	if(inventory_items[i] == noone) continue;
	if(i < 45 || i > 53) continue;
	//if(!(i >= 45 && i <= 53)) continue;
	
	show_debug_message(string(inventory_items[i]) + " " + string(i));
}

draw_rectangle_color(x_offset, y_offset, x_offset + width, y_offset + height, c_red, c_red, c_red, c_red, false);