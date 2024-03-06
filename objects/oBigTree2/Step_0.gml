if(collisions) ds_list_destroy(collisions);
collisions = ds_list_create();

if(doCollisionAlphaCheck) {
	coll_rect_leaves = collision_rectangle_list(x, y + (5 * image_yscale), x + sprite_width, y + (50 * image_yscale), global.environment_interactable_objects, false, true, collisions, false);
	coll_rect_trunk = collision_rectangle_list(x + (12 * image_xscale), y + (50 * image_yscale), x + (18 * image_xscale), y + sprite_height, global.environment_interactable_objects, false, true, collisions, false);
}

if(isInteractable) {
	interact_message = $"Press \"{keytostring(global.interact_key)}\" to break tree";

	// Interaction checks
	if(!has_been_interacted && keyboard_check_pressed(global.interact_key)) {
		if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
			// What to do if interacted with
			if(oPlayer.holding != undefined && oPlayer.holding.name == "axe") {
				woodAmount = irandom_range(1,2);
				item = oInventory.inventory.item_add("wood", woodAmount);
				doCollisionAlphaCheck = false;
				has_been_interacted = true;
				sprite_index = sBigTree2Stump;
			
				showMessage($"Collected {item.options.displayName}! {woodAmount}x");
				
				stickAmount = irandom_range(0,2);
				
				if(stickAmount > 0) {
					item = oInventory.inventory.item_add("stick", stickAmount);
					showMessage($"Collected {item.options.displayName}! {stickAmount}x");
				}
			
			} else {
				showMessage($"You need to be holding an axe to chop down a tree!");
			}
		}
	}
}