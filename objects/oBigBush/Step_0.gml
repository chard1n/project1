if(collisions) ds_list_destroy(collisions);
collisions = ds_list_create();

if(doCollisionAlphaCheck) {
	coll_rect_leaves = collision_rectangle_list(x + (1 * image_xscale), y + (15 * image_yscale), x + sprite_width - (1 * image_xscale), y + sprite_height, global.environment_interactable_objects, false, true, collisions, false);
}

if(isInteractable) {
	interact_message = $"Press \"{keytostring(global.interact_key)}\" to search bush";
	// Interaction checks
	if(!has_been_interacted && keyboard_check_pressed(global.interact_key)) {
		if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
			// What to do if interacted with
			if(true) {
				herbAmount = irandom_range(0,2);
				if(herbAmount > 0) {
					item = oInventory.inventory.item_add("herb", herbAmount);
					showMessage($"Collected {item.options.displayName}! {herbAmount}x");
				}
				
				fiberAmount = irandom_range(1,2);
				
				item = oInventory.inventory.item_add("fiber", fiberAmount);
					
				showMessage($"Collected {item.options.displayName}! {fiberAmount}x");
				
				doCollisionAlphaCheck = false;
				has_been_interacted = true;
			} 
		}
	}
}
