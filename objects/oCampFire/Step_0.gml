interact_message = $"Press \"{keytostring(global.interact_key)}\" to interact";

if(!has_been_interacted && keyboard_check(global.interact_key)) {
	if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
		has_been_interacted = true;
		
		show_message("Interacted!")
	}
}

if(strength > 0) {
	strength -= 0.05;	
}

