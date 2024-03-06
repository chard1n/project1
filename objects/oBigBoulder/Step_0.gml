if(collisions) ds_list_destroy(collisions);
collisions = ds_list_create();

if(doCollisionAlphaCheck)
coll_rect_bigBoulder = collision_rectangle_list(x, y, x+sprite_width, y+sprite_height, global.environment_interactable_objects, false, true, collisions, false);


if(isInteractable) {
	interact_message = $"Press \"{keytostring(global.interact_key)}\" to break rock";
	// Interaction checks
	if(!has_been_interacted && keyboard_check_pressed(global.interact_key)) {
		if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
			// What to do if interacted with
			if(oPlayer.holding != undefined && oPlayer.holding.name == "pickaxe") {
				rockAmount = irandom_range(1,2);
				
				item = oInventory.inventory.item_add("rock", rockAmount);
				showMessage($"Collected {item.options.displayName}! {rockAmount}x");
				
				doCollisionAlphaCheck = false;
				has_been_interacted = true;
				sprite_index = sRockRubble;
				
			} else {
				showMessage($"You need to be holding a pickaxe to break the rock!");
			}
		}
	}
}