if(collisions) ds_list_destroy(collisions);
collisions = ds_list_create();

if(doCollisionAlphaCheck) {
	collision_rectangle_list(x + (8 * image_xscale), y + (15 * image_yscale), x + (25 * image_xscale), y + (25 * image_yscale), global.environment_interactable_objects, false, true, collisions, false);
	
}

if(isInteractable) {
	interact_message = $"Press \"{keytostring(global.interact_key)}\" look inside";
	// Interaction checks
	if(!has_been_interacted && keyboard_check_pressed(global.interact_key)) {
		if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
			if(true) {
				amount = 1;
				item = oInventory.inventory.item_add("mysteriousBook", amount);
				
				has_been_interacted = true;
				
			
				showMessage($"Collected {item.options.displayName}! {amount}x");
				
				startDialogue("MysteriousTent");
			
			} 
		}
	}
}