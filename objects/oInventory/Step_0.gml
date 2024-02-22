if(!opened) {
	return;	
}

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);


if mouse_wheel_up() {
    scroll_value -= 50;
} else if mouse_wheel_down() {
    scroll_value += 50;
}

scroll_value = clamp(scroll_value, 0, (array_length(inventory.recipe_get()) * (ui_inventory_margin + ui_inventory_box)) - (ui_border_size * 10) );

var inventory_items = inventory.item_get();
var pos_x = 0;
var pos_y = 0; 
	
if(mouse_check_button_released(mb_left)) {		
	#region INVENTORY	
		for (var row = 0; row < inventory.get_height(); row++) {				
			pos_y = ui_padding_y + (ui_border_size * 13) + (row * (ui_inventory_margin + ui_inventory_box));
			for (var column = 0; column < inventory.get_width(); column++) {
				pos_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (column * (ui_inventory_margin + ui_inventory_box));
				
				if(is_between(mx, pos_x, pos_x + ui_inventory_box)) {
					if(is_between(my, pos_y, pos_y + ui_inventory_box)) {
						var inventory_index = (row * inventory.get_width()) + column;
						// Check if we have an inventory item here
						if(inventory_items[inventory_index] != noone) {
							show_debug_message($"Using {inventory_items[inventory_index].name}");
							last_selected = inventory_items[inventory_index].name;
							show_debug_message(inventory_index)
						
						} else {		
							
							if(last_selected != noone) {
								inventory.item_move(last_selected, inventory_index);
								last_selected = noone;
							}
							
							show_debug_message("No inventory item here !");
							show_debug_message(inventory_index)
						}
					}
				}
			}
		}
	#endregion
	
	#region RECIPE
		var _recipies = inventory.recipe_get();
		var pos_x = (ui_border_size * 3) + 4;
		for(var recipe_index = 0; recipe_index < array_length(_recipies); recipe_index++) {
			var pos_y = (recipe_index * (ui_inventory_margin + ui_inventory_box)) - scroll_value;
			// hover
			if(is_between(mx, pos_x + ui_padding_x, pos_x + ui_padding_x + ui_panel_left - 64)) {
				if(is_between(my, pos_y + ui_padding_y + (ui_border_size * 8), pos_y + ui_padding_y + ui_inventory_box + (ui_border_size * 8))) {
					if(inventory.recipe_has(_recipies[recipe_index].name)) {
						inventory.recipe_craft(_recipies[recipe_index].name);
					}
				}
			}
		}
	#endregion
}