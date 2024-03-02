/// @description 

randomize();

inventory = new Recipe();

inventory.item_add("rock", 3, sRock);
inventory.item_add("stick", 2, sStick);
inventory.item_add("bone", 1, sBone);
inventory.item_add("skull", 1, sSkull);
inventory.item_add("phone", 1, sPhone);
inventory.item_add("campFire", 1, sCampFire)


// recipes
inventory.recipe_add("Electronic Parts", [
	{
		name: "phone",
		quantity: 1
	}], [{
		name: "electronicParts",
		quantity: 1,
		sprite: sElectronicParts
	}], sElectronicParts);
	
inventory.recipe_add("boneClub", [
	{
		name: "stick",
		quantity: 1
	},
	{
		name: "skull",
		quantity: 1
	}], [{
		name: "boneClub",
		quantity: 1,
		sprite: sBoneClub
	}], sBoneClub);
	
inventory.recipe_add("rock", [
	{
		name: "rock",
		quantity: 3
	},], [{
		name: "rock",
		quantity: 2,
		sprite: sRock
	}], sRock);
	
	
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