var collision_objects = [oBush, oSmallTree, oBigTree1, oBigTree2, oPlane, oCampFire, oBigBoulder];

var _keyInventory = keyboard_check_released(ord("E"));
var _keyEscape = keyboard_check_released(vk_escape);

var vertMove = keyboard_check(ord("S")) - keyboard_check(ord("W"))
var horzMove = keyboard_check(ord("D")) - keyboard_check(ord("A"))

// Inventory
if(oInventory.opened == false && _keyInventory) {
	oInventory.opened = true;
	oHotbar.shown = false;
} else if(oInventory.opened == true && (_keyEscape || _keyInventory)) {
	oInventory.opened = false;
	oHotbar.shown = true;
}
// Change 2.0

// Movement
yspd = vertMove * spd
xspd = horzMove * spd

y += yspd
x += xspd

// Collision
// ADD ANY OTHER COLLISION TO THIS ARRAY
if (place_meeting(x + xspd, y, collision_objects)) {
	x -= xspd
}

if (place_meeting(x, y + yspd, collision_objects)) {
	y -= yspd
}

// If player is inside a collision mask (Sometimes can happen when sprite changes)
// Move them up slowly until they are not longer inside collision mask
if(place_meeting(x, y, collision_objects)) {
	y -= 1;	
}




