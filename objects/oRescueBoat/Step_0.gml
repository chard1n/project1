interact_message = $"Press \"{keytostring(global.interact_key)}\" to get in boat";

// Interaction checks
if(keyboard_check_pressed(global.interact_key)) {
	if(!has_been_interacted && collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
		has_been_interacted = true;

		startDialogue("GetInBoat");
		
		playerIsInside = true;
	}
}

if(playerIsInside) {
	x += 0.5;
	
	oPlayer.x = x + inside_xOffset;	
	oPlayer.y = y + inside_yOffset;
}

if(x > room_width) {
	room_goto(rm_credits);
}