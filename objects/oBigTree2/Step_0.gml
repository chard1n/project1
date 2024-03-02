if(doCollisionAlphaCheck) {
	coll_rect_leaves = collision_rectangle(x, y + (5 * image_yscale), x + sprite_width, y + (50 * image_yscale), global.environment_interactable_objects, false, true);
	coll_rect_trunk = collision_rectangle(x + (12 * image_xscale), y + (50 * image_yscale), x + (18 * image_xscale), y + sprite_height, global.environment_interactable_objects, false, true);
} else {
	coll_rect_leaves = undefined;
	coll_rect_trunk = undefined;
}

interact_message = $"Press \"{keytostring(global.interact_key)}\" to break tree";

// Interaction checks
if(!has_been_interacted && keyboard_check_pressed(global.interact_key)) {
	if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
		// What to do if interacted with
		// TODO: Check if player is holding axe?
		if(/*oPlayer.holding != undefined && oPlayer.holding.name == "axe"*/ true) {
			amount = irandom_range(1,2);
			oInventory.inventory.item_add("wood", amount, sWood);
			doCollisionAlphaCheck = false;
			has_been_interacted = true;
			sprite_index = sBigTree2Stump;
			
			showMessage($"You got a piece of wood! {amount}x");
			
			
		} 
	}
}

