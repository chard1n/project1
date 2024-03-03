interact_message = $"Press \"{keytostring(global.interact_key)}\" to stoke fire";

/*
Add the following code to the "if" statement (next to keyboard_check_pressed)
to only allow a interactable object to be used once

	!has_been_interacted &&

Inside the if statement, add:

	has_been_interacted = true;

to prevent the object from being used again.

*/

// Interaction checks
if(keyboard_check_pressed(global.interact_key)) {
	if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
		// What to do if interacted with
		if(oInventory.inventory.item_find("stick") != -1) {
			
			oInventory.inventory.item_subtract("stick", 1);

			strength = clamp(strength + stoke_amount,min_strength, max_strength);
			
		} else {
			// TODO: Alert player that they are missing resources!	
		}

	}
}

if(strength > min_strength) {
	strength -= 0.025;
}

if(strength > min_strength) {
	sprite_index = sCampFireLit;
} else {
	sprite_index = sCampFireOut;
}