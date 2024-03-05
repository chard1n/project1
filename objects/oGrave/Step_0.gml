if(isInteractable) {
	interact_message = $"Press \"{keytostring(global.interact_key)}\" collect items";

	// Interaction checks
	if(!has_been_interacted && keyboard_check_pressed(global.interact_key)) {
		if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
			amount = irandom_range(1,2);
			for(i = 0; i < array_length(stored_items); i++) {
				item = oInventory.inventory.item_add(stored_items[i].name, stored_items[i].quantity);
				
				showMessage($"You got {item.options.displayName}! {stored_items[i].quantity}x");
			}
			
			has_been_interacted = true;
			
		}
	}
}