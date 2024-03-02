/// @description 

randomize();

inventory = new Recipe();

inventory.item_add("Rock", 3, sRock_Item);
inventory.item_add("Stick", 2, sStick_Item);
inventory.item_add("Bone", 1, sBone_Item);
inventory.item_add("Skull", 1, sSkull_Item);
inventory.item_add("CellPhone", 1, sPhone_Item);
inventory.item_add("CampFire", 1, sCampFire, { object: oCampFire, isPlaceable: true, x_scale: 0.4, y_scale: 0.4, x_offset: 50, y_offset: 0, rotation: 0 })


// recipes
inventory.recipe_add("Electronic Parts", [
	{
		name: "Cell Phone",
		quantity: 1
	}], [{
		name: "Electronic Parts",
		quantity: 1,
		sprite: sElectronic_Parts_item
	}], sElectronic_Parts_item);
	
inventory.recipe_add("Bone_Club", [
	{
		name: "Stick",
		quantity: 1
	},
	{
		name: "Skull",
		quantity: 1
	}], [{
		name: "Bone_club",
		quantity: 1,
		sprite: sBone_Club
	}], sBone_Club);
	
inventory.recipe_add("Rock", [
	{
		name: "Rock",
		quantity: 3
	},], [{
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

color_background = #A3620A;
color_border = #331E02;
color_inventory_text = c_white;
color_inventory_highlight = c_white;
color_inventory_disabled = c_black;

last_selected = noone;
selected_index = -1;
opened = false;
scroll_value = 0;