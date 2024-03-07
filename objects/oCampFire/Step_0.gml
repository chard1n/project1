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
			
			showMessage($"You stoked the first using a stick!");
			
		} else {
			showMessage($"You need to have sticks to stoke the fire!");
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

if((snd == undefined && distance_to_object(oPlayer) < 200) || (distance_to_object(oPlayer) < 200 && (snd != undefined && !audio_is_playing(snd) ))) {
	snd = audio_play_sound(campfire_crackling_fireplace_sound_119594,10,true);	
} else if(snd != undefined && distance_to_object(oPlayer) > 200) {
	audio_stop_sound(snd)	
}