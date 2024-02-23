var _keyInventory = keyboard_check_released(ord("E"));
var _keyEscape = keyboard_check_released(vk_escape);

var vertMove = keyboard_check(ord("S")) - keyboard_check(ord("W"))
var horzMove = keyboard_check(ord("D")) - keyboard_check(ord("A"))

// Inventory
if(oInventory.opened == false && _keyInventory) {
	oInventory.opened = true;
} else if(oInventory.opened == true && (_keyEscape || _keyInventory)) {
	oInventory.opened = false;
}

// Movement
yspd = vertMove * spd
xspd = horzMove * spd

y += yspd
x += xspd

// Collision
// ADD ANY OTHER COLLISION TO THIS ARRAY
if (place_meeting(x + xspd, y, [oBush])) {
	x -= xspd
}

if (place_meeting(x, y + yspd, [oBush])) {
	y -= yspd
}





