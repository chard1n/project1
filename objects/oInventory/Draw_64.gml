if(!opened) {
	return;	
}

var g_width = display_get_gui_width();
var g_height = display_get_gui_height();


draw_set(c_black, 0.3);

draw_rectangle(0, 0, g_width, g_height, false);

draw_reset();

// draw outside rectangle
draw_set(color_border, 1);
draw_rectangle(
	ui_padding_x,
	ui_padding_y,
	g_width - ui_padding_x,
	g_height - ui_padding_y,
	false
);

// draw rectangle inside
draw_set(color_background, 1);
draw_rectangle(
	ui_padding_x + ui_border_size,
	ui_padding_y + ui_border_size,
	g_width - ui_padding_x - ui_border_size,
	g_height - ui_padding_y - ui_border_size,
	false
);

// draw horizontal line
draw_set(color_border, 1);
draw_rectangle(
	ui_padding_x + ui_panel_left,
	ui_padding_y + ui_border_size,
	ui_padding_x + ui_panel_left + ui_border_size,
	g_height - ui_padding_y - ui_border_size,
	false
);

// draw text
draw_set_font(fn_Ubuntu);
text_align(fa_left, fa_top);
draw_set(color_inventory_text, 1);

draw_set(c_black, 0.5);
draw_text(
	ui_padding_x + (ui_border_size * 3) + 4,
	ui_padding_y + (ui_border_size * 4) + 4,
	"Recipes"
);
draw_set(c_white, 1);
draw_text(
	ui_padding_x + (ui_border_size * 3),
	ui_padding_y + (ui_border_size * 4),
	"Recipes"
);

draw_set(c_black, 0.5);
draw_text(
	ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin + 4,
	ui_padding_y + (ui_border_size * 4) + 4,
	"Inventory"
);
draw_set(c_white, 1);
draw_text(
	ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_margin,
	ui_padding_y + (ui_border_size * 4),
	"Inventory"
);

// reset text
draw_set_font(-1);

// mouse position
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// draw inventory place holders
inventory_items = inventory.item_get();
for (var row = 0; row < inventory.get_height(); row++) {
	var pos_y = ui_padding_y + (ui_border_size * 13) +
	(row * (ui_inventory_margin + ui_inventory_box));
    for (var column = 0; column < inventory.get_width(); column++) {
		var pos_x = ui_padding_x + ui_panel_left + ui_border_size + ui_inventory_padding + (column * (ui_inventory_margin + ui_inventory_box));
		
		// draw offset sprite for shadow
		draw_sprite_ext(
			sInventory_Box,
			0,
			pos_x + 4,
			pos_y + 4,
			1,
			1,
			0,
			c_black,
			0.4
		);
		
		if(row < inventory.get_height() - 1) {
			// draw hotbar box sprite
			draw_sprite(sInventory_Box, 0, pos_x, pos_y);
		} else {
			// draw inventory box sprite
			draw_sprite(sHotbar_Box, 0, pos_x, pos_y);
		}
		
		var inventory_index = (row * inventory.get_width()) + column;
		if(inventory_items[inventory_index] != noone) {
			if(selected_index == inventory_index) {
				continue; //This will be drawn later
			}
			
			// draw inventory sprite
			draw_sprite(inventory_items[inventory_index].sprite, 0, pos_x + sprite_get_width(inventory_items[inventory_index].sprite) / 2, pos_y + sprite_get_height(inventory_items[inventory_index].sprite) / 2);
		}
		
		//// if our mouse is between one of the columns let's highlight it
		if(is_between(mx, pos_x, pos_x + ui_inventory_box)) {
			if(is_between(my, pos_y, pos_y + ui_inventory_box)) {
				draw_set(color_inventory_highlight, 0.2);
				draw_rectangle(
					pos_x,
					pos_y,
					pos_x + ui_inventory_box,
					pos_y + ui_inventory_box,
					false
				);
				draw_reset();
			}
		}

		//// now do this again but for quantity only
		if(inventory_items[inventory_index] != noone && selected_index != inventory_index ) {
			draw_set(#232323, 1);
			draw_circle(
				pos_x + ui_inventory_box,
				pos_y + ui_inventory_box,
				14,
				false
			);
			
			draw_set(c_white, 1);
			text_align(fa_center, fa_middle);
			
			draw_text(
				pos_x + ui_inventory_box,
				pos_y + ui_inventory_box,
				inventory_items[inventory_index].quantity
			);
		}
	}
}

for(var itemIdx = 0; itemIdx < array_length(inventory_items); itemIdx++) {
		if(inventory_items[itemIdx] == noone || selected_index != itemIdx) continue;
	
		// Draw selected sprite on mouse
		draw_sprite_ext(inventory_items[itemIdx].sprite, 0, mx, my,1,1,0,c_white,0.5);
		
		draw_set(#232323, 1);
		draw_circle(
			mx + ui_inventory_box - 32,
			my + ui_inventory_box - 32,
			14,
			false
		);
			
		draw_set(c_white, 1);
		text_align(fa_center, fa_middle);
			
		draw_text(
			mx + ui_inventory_box - 32,
			my + ui_inventory_box - 32,
			inventory_items[itemIdx].quantity
		);
				
}
		
_x =  ( ui_panel_left + ui_padding_x ) - ( ui_padding_x + ui_border_size );
_y =  ( g_height - ui_padding_y - ui_border_size - (ui_border_size * 8) ) - ( ui_padding_y + ui_border_size );

surf = surface_create(_x, _y);

surface_set_target(surf);

// recipe GUI
var _recipies = inventory.recipe_get();
var pos_x = (ui_border_size * 3) + 4;
for(var recipe_index = 0; recipe_index < array_length(_recipies); recipe_index++) {
	var pos_y = (recipe_index * (ui_inventory_margin + ui_inventory_box)) - scroll_value;
	
		
		draw_sprite(sInventory_Recipe_Box, 0, pos_x, pos_y);
		draw_sprite(_recipies[recipe_index].sprite, 0, pos_x + sprite_get_width(_recipies[recipe_index].sprite) / 2, pos_y + sprite_get_height(_recipies[recipe_index].sprite) / 2);
	
		draw_set_halign(fa_left);
		draw_text(pos_x + 56, pos_y + 16, string(_recipies[recipe_index].name) + " (" + string(_recipies[recipe_index].products[0].quantity) + ")");
	
		var requirement_string = "";
		for(var requirement_index = 0; requirement_index < array_length(_recipies[recipe_index].requirements); requirement_index++) {
			requirement_string += $"{_recipies[recipe_index].requirements[requirement_index].name}: {_recipies[recipe_index].requirements[requirement_index].quantity}";
			if(requirement_index < array_length(_recipies[recipe_index].requirements) - 1) {
				requirement_string += ", ";
			}
		}
		
		requirement_string = $"REQ: {requirement_string}";
		
		max_width = 198;
		if(string_width(requirement_string) > max_width) {
			draw_text_ext(pos_x + 56, pos_y + 25 + 16, requirement_string, 16, max_width);
		} else {
			draw_text(pos_x + 56, pos_y + 25 + 16, requirement_string);
		}
		
		if(!inventory.recipe_has(_recipies[recipe_index].name)) {
			draw_set(color_inventory_disabled, 0.5);
			draw_rectangle(
				pos_x,
				pos_y,
				pos_x + ui_panel_left - 64,
				pos_y + ui_inventory_box,
				false
			);	
			draw_reset();
		}
		
		
	
}

// hover
pos_x = (ui_border_size * 3) + 4;
for(var recipe_index = 0; recipe_index < array_length(_recipies); recipe_index++) {
	pos_y = (recipe_index * (ui_inventory_margin + ui_inventory_box)) - scroll_value;
	if(is_between(mx, pos_x + ui_padding_x, pos_x + ui_padding_x + ui_panel_left - 64)) {
		if(is_between(my, pos_y + ui_padding_y + (ui_border_size * 8), pos_y + ui_padding_y + ui_inventory_box + (ui_border_size * 8))) {
			
			if(inventory.recipe_has(_recipies[recipe_index].name)) {
				draw_set(color_inventory_highlight, 0.2);
				draw_rectangle(
					pos_x,
					pos_y,
					pos_x + ui_panel_left - 64,
					pos_y + ui_inventory_box,
					false
				);
			
				draw_reset();
			}
			
		}
	}
}

surface_reset_target();

draw_surface(surf, ui_padding_x + ui_border_size, ui_padding_y + ui_border_size + (ui_border_size * 8));

surface_free(surf); // Fixes memory leak!

draw_reset();
