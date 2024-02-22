/// @description 

randomize();

inventory = new Recipe();

inventory.item_add("Rock", 3, sRock_Item);
inventory.item_add("Stick", 2, sStick_Item);
/*
inventory.item_add("Wood", 2, spr_Item_Wood);
inventory.item_add("Stone", 10, spr_Item_Stone);
inventory.item_add("Fish", 10, spr_Item_Fish);
inventory.item_add("Stick", 4, spr_Item_Stick);
*/

// recipies
inventory.recipe_add("Stick", [
	{
		name: "Stick",
		quantity: 1
	}], [{
		name: "Stick",
		quantity: 2,
		sprite: sStick_Item
	}], sStick_Item);
	
inventory.recipe_add("Rock", [
	{
		name: "Rock",
		quantity: 1
	}], [{
		name: "Rock",
		quantity: 2,
		sprite: sRock_Item
	}], sRock_Item);
	
	
// UI INFORMATION //

display_set_gui_size(1280, 720);

ui_padding_x = 64;
ui_padding_y = 64;
ui_panel_left = 320;
ui_border_size = 8;
ui_inventory_padding = 48;
ui_inventory_box = 64;
ui_inventory_margin = 16;
ui_recipy_max = 6;

color_background = #55507a;
color_border = #36234a;
color_inventory_text = c_white;
color_inventory_highlight = c_white;

last_selected = noone;
opened = false;
scroll_value = 0;