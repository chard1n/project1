if(isInteractable) {
	interact_message = $"Press \"{keytostring(global.interact_key)}\" to pick up";
	// Interaction checks
	if(!has_been_interacted && keyboard_check_pressed(global.interact_key)) {
		if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
			if(true) {
				amount = irandom_range(1,2);
				item = oInventory.inventory.item_add("stick", amount);
				has_been_interacted = true;
				instance_destroy();
			
				showMessage($"Collected {item.options.displayName}! {amount}x");
			
			} 
		}
	}
}