if(collisions) ds_list_destroy(collisions);
collisions = ds_list_create();

if(doCollisionAlphaCheck) {
	collision_rectangle_list(x+64, y+100, x+(sprite_width-64), y+240, global.environment_interactable_objects, false, true, collisions, false);
	collision_rectangle_list(x+134, y+246, x+208, y+sprite_height, global.environment_interactable_objects, false, true, collisions, false);
}

if(isInteractable) {
	interact_message = $"Press \"{keytostring(global.interact_key)}\" to break tree";
	// Interaction checks
	if(!has_been_interacted && keyboard_check_pressed(global.interact_key)) {
		if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
			// What to do if interacted with
			if(oPlayer.holding != undefined && oPlayer.holding.name == "axe") {
				amount = irandom_range(1,2);
				item = oInventory.inventory.item_add("wood", amount);
				doCollisionAlphaCheck = false;
				has_been_interacted = true;
				sprite_index = sBigTree1Stump;
			
				showMessage($"Collected {item.options.displayName}! {amount}x");
			
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
