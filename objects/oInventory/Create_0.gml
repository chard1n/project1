randomize();
surf = noone;

inventory = new Recipe();

inventory.item_add("rock", 8);
inventory.item_add("stick", 4);
inventory.item_add("bone", 1);
inventory.item_add("skull", 1);
inventory.item_add("brokenPhone", 1);
inventory.item_add("campFire", 1)

inventory.item_add("pickaxe", 1)
inventory.item_add("axe", 1)
inventory.item_add("boneClub", 1)
inventory.item_add("bandages", 8)


// recipes
inventory.recipe_add("rope", [
	{
		name: "fiber",
		quantity: 2
	}], [{
		name: "rope",
		quantity: 1,
		sprite: sRope,
	}], sRope, "Used in some crafting recipes");
	
inventory.recipe_add("axe", [
	{
		name: "rock",
		quantity: 5
	},
	{
		name: "stick",
		quantity: 2,
	},
	{
		name: "rope",
		quantity: 1,
	}], [{
		name: "axe",
		quantity: 1,
		sprite: sAxe,
	}], sAxe, "Used to break trees");
	
inventory.recipe_add("pickaxe", [
	{
		name: "rock",
		quantity: 5
	},
	{
		name: "stick",
		quantity: 2,
	},
	{
		name: "rope",
		quantity: 1,
	}], [{
		name: "pickaxe",
		quantity: 1,
		sprite: sPickaxe,
	}], sPickaxe, "Used to break large rocks");
	
	
inventory.recipe_add("campFire", [
	{
		name: "wood",
		quantity: 2
	},
	{
		name: "coal",
		quantity: 1
	}], [{
		name: "campFire",
		quantity: 1,
		sprite: sCampFire,
	}], sCampFire, "Can be used to keep cannibals away");
	
inventory.recipe_add("boneClub", [
	{
		name: "stick",
		quantity: 1
	},
	{
		name: "skull",
		quantity: 1
	},
	{
		name: "rope",
		quantity: 1,
	}], [{
		name: "boneClub",
		quantity: 1,
		sprite: sBoneClub,
	}], sBoneClub, "Great for attacking enemies");
	
inventory.recipe_add("bandages", [
	{
		name: "herb",
		quantity: 1
	},
	{
		name: "cloth",
		quantity: 2
	}], [{
		name: "bandages",
		quantity: 1,
		sprite: sBandages,
	}], sBandages, "Great for healing your wounds");
	
inventory.recipe_add("copper", [
	{
		name: "rawCopper",
		quantity: 1
	},
	{
		name: "coal",
		quantity: 2
	}], [{
		name: "copper",
		quantity: 1,
		sprite: sCopper,
	}], sCopper, "Smelt raw copper into copper");
	
inventory.recipe_add("metal", [
	{
		name: "rawMetal",
		quantity: 1
	},
	{
		name: "coal",
		quantity: 2
	}], [{
		name: "metal",
		quantity: 1,
		sprite: sMetal,
	}], sMetal, "Smelt raw metal into metal");
	
inventory.recipe_add("electronics", [
	{
		name: "brokenPhone",
		quantity: 1
	}], [{
		name: "electronicParts",
		quantity: 1,
		sprite: sElectronics,
	}], sElectronics);

inventory.recipe_add("copperWire", [
	{
		name: "copper",
		quantity: 2
	}], [{
		name: "copperWire",
		quantity: 1,
		sprite: sCopperWire,
	}], sCopperWire);
	
inventory.recipe_add("antenna", [
	{
		name: "copperWire",
		quantity: 5
	},
	{
		name: "metal",
		quantity: 5
	},
	{
		name: "rope",
		quantity: 3
	}], [{
		name: "antenna",
		quantity: 1,
		sprite: sAntenna,
	}], sAntenna, "Used to craft transponder");
	
inventory.recipe_add("transponder", [
	{
		name: "antenna",
		quantity: 1
	},
	{
		name: "metal",
		quantity: 5
	},
	{
		name: "electronics",
		quantity: 1
	}], [{
		name: "transponder",
		quantity: 1,
		sprite: sTempTransponder,
	}], sTempTransponder, "May be useful to contact for help");


	
	
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