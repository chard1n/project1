_keyOne = keyboard_check_pressed(ord("1"));
_keyTwo = keyboard_check_pressed(ord("2"));
_keyThree = keyboard_check_pressed(ord("3"));
_keyFour = keyboard_check_pressed(ord("4"));
_keyFive = keyboard_check_pressed(ord("5"));
_keySix = keyboard_check_pressed(ord("6"));
_keySeven = keyboard_check_pressed(ord("7"));
_keyEight = keyboard_check_pressed(ord("8"));
_keyNine = keyboard_check_pressed(ord("9"));
_scrollDown = mouse_wheel_down();
_scrollUp = mouse_wheel_up();

if(_keyOne) {
	selected_slot = 0;
} else if(_keyTwo) {
	selected_slot = 1;
} else if(_keyThree) {
	selected_slot = 2;
} else if(_keyFour) {
	selected_slot = 3;
} else if(_keyFive) {
	selected_slot = 4;
} else if(_keySix) {
	selected_slot = 5;
} else if(_keySeven) {
	selected_slot = 6;
} else if(_keyEight) {
	selected_slot = 7;
} else if(_keyNine) {
	selected_slot = 8;
} else if(_scrollDown) {
	if(selected_slot < total_slots - 1) {
		selected_slot += 1;
	}
} else if(_scrollUp) {
	if(selected_slot > 0) {
		selected_slot -= 1;
	}
}