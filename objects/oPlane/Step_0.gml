interact_message = $"Press \"{keytostring(global.interact_key)}\" to interact";

// Interaction checks
if(!has_been_interacted && keyboard_check_pressed(global.interact_key)) {
	if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
		// What to do if interacted with
		
		
			amount = 1;
			item = oInventory.inventory.item_add("pocketknife", amount);
			
			has_been_interacted = true;
			
			
			showMessage($"Collected {item.options.displayName}! {amount}x");
			
			startDialogue("OpenInventory");
	
	}
}
