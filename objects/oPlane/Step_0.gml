interact_message = $"Press \"{keytostring(global.interact_key)}\" to interact";

// Interaction checks
if(!has_been_interacted && keyboard_check_pressed(global.interact_key)) {
	if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
		// What to do if interacted with
		
		
			amount = 1;
			oInventory.inventory.item_add("pocketKnife", amount, sPocketKnife);
			
			has_been_interacted = true;
			
			
			showMessage($"You got a pocketknife! {amount}x");
			
			
	
	}
}
