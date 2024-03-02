
var _keyInventory = keyboard_check_released(ord("E"));
var _keyEscape = keyboard_check_released(vk_escape);
var _keyPlace = keyboard_check_released(global.place_key);

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

// Normalize the diagonal movement
if (xspd != 0 && yspd != 0) {
    magnitude = sqrt(xspd * xspd + yspd * yspd);
    xspd = (xspd / magnitude) * spd;
    yspd = (yspd / magnitude) * spd;
}

y += yspd
x += xspd

// Collision
// ADD ANY OTHER COLLISION TO THIS ARRAY
if (place_meeting(x + xspd, y, global.collision_objects)) {
	x -= xspd
}

if (place_meeting(x, y + yspd, global.collision_objects)) {
	y -= yspd
}

// If player is inside a collision mask (Sometimes can happen when sprite changes)
// Move them up slowly until they are not longer inside collision mask
if(place_meeting(x, y, global.collision_objects)) {
	y -= 1;	
}

// Check if player is inside lighting
isInsideLight = false;	
with(oCampFire) {
	if(point_distance(x,y,oPlayer.x,oPlayer.y) < strength) {
		other.isInsideLight = true;	
	}
}

if(_keyPlace) {
	if(!place_meeting(x,y,global.collision_objects)) {
		if(holding != undefined) {
			if(holding.options.isPlaceable) {
				instance_create_layer(x,y, "Instances",  holding.options.object);
				oInventory.inventory.item_subtract(holding.name, 1);
			}
		}
	}
}