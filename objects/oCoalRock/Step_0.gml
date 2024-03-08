if(collisions) ds_list_destroy(collisions);
collisions = ds_list_create();

if(doCollisionAlphaCheck) {
	collision_rectangle_list(x+ (image_xscale), y + (5 * image_yscale), x + sprite_width - (image_xscale), y+sprite_height, global.environment_interactable_objects, false, true, collisions, false);
}

if(isInteractable) {
	interact_message = $"Press \"{keytostring(global.interact_key)}\" to mine coal";
	// Interaction checks
	if(!has_been_interacted && keyboard_check_pressed(global.interact_key)) {
		if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
			// What to do if interacted with
			if(oPlayer.holding != undefined && oPlayer.holding.name == "pickaxe") {
				amount = irandom_range(2,4);
				item = oInventory.inventory.item_add("coal", amount);
				doCollisionAlphaCheck = false;
				has_been_interacted = true;
				sprite_index = sRockRubble;
			
				showMessage($"Collected {item.options.displayName}! {amount}x");
			
			} else {
				showMessage($"You need to be holding a pickaxe to break the coal rock!");
			}
		}
	}
}
