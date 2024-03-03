collisions = ds_list_create();

if(doCollisionAlphaCheck) {
	coll_rect_leaves = collision_rectangle_list(x+16, y+48, x+(sprite_width-32), y+240, global.environment_interactable_objects, false, true, collisions, false);
	coll_rect_trunk = collision_rectangle_list(x+134, y+246, x+208, y+sprite_height, global.environment_interactable_objects, false, true, collisions, false);
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
			sprite_index = sBigTree1Stump;
			
			showMessage($"You got a piece of wood! {amount}x");
			
		} 
	}
}
