interact_message = $"Press \"{keytostring(global.interact_key)}\" to interact";

if(!has_been_interacted && keyboard_check(global.interact_key)) {
	if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
		has_been_interacted = true;
		
		show_message("Interacted!")
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