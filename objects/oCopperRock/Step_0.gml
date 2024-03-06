if(collisions) ds_list_destroy(collisions);
collisions = ds_list_create();

if(doCollisionAlphaCheck) {
	collision_rectangle_list(x+ (2 * image_xscale), y + (13 * image_yscale), x + sprite_width - (2 * image_xscale), y+sprite_height, global.environment_interactable_objects, false, true, collisions, false);
}

if(isInteractable) {
	interact_message = $"Press \"{keytostring(global.interact_key)}\" to mine raw copper";
	// Interaction checks
	if(!has_been_interacted && keyboard_check_pressed(global.interact_key)) {
		if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
			// What to do if interacted with
			// TODO: Check if player is holding axe?
			if(/*oPlayer.holding != undefined && oPlayer.holding.name == "axe"*/ true) {
				amount = irandom_range(1,2);
				item = oInventory.inventory.item_add("rawCopper", amount);
				doCollisionAlphaCheck = false;
				has_been_interacted = true;
				sprite_index = sBigTree1Stump;
			
				showMessage($"Collected {item.options.displayName}! {amount}x");
			
			} 
		}
	}
}
