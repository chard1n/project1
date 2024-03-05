var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if(!global.debug) {
	oPlayer.typing = false;
}

if(oPlayer.typing) {
	if(keyboard_key && keyboard_check_pressed(keyboard_lastkey)) {
		if( array_contains(allowedKeys, keyboard_lastchar) ) {
			inputMessage += keyboard_lastchar;
			show_debug_message(inputMessage);
		} else if(keyboard_key == vk_backspace) {
			if(string_length(inputMessage) > 0) {
				inputMessage = string_delete(inputMessage, string_length(inputMessage), 1);
			}
		}
	}
	if(keyboard_check_pressed(vk_enter)) {
		oPlayer.typing = false;
		
		if(inputMessage != "") {
			
			args = string_split(inputMessage, " ");
			amount = 1;
			
			if(array_length(args) >= 2) {
				str = string_digits(args[1]);
				if(string_length(str) > 0) { 
					amount = real(str);
				}
			}
		
			item = oInventory.inventory.item_add(args[0], amount);
		
			showMessage($"You got {item.options.displayName}! {amount}x");
		
			inputMessage = "";
			
		}
	}
}

if(mouse_check_button_pressed(mb_left)) {
	if(is_between(mx, x_offset, x_offset + width) && is_between(my, y_offset, y_offset + height)) {
		oPlayer.typing = true;
	} else {
		oPlayer.typing = false;	
	}
}

