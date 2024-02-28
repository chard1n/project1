if(!has_been_interacted) {
	if(collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
		has_been_interacted = true;
		
		show_message("Interacted!")
	}
}