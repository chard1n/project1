interact_message = $"Press \"{keytostring(global.interact_key)}\" to call for help";

// Interaction checks
if(keyboard_check_pressed(global.interact_key)) {
	if(!has_been_interacted && collision_circle(x_center,y_center,interact_radius,oPlayer, false, true)) {
		has_been_interacted = true;

		startDialogue("TransponderActivated");
	}
}