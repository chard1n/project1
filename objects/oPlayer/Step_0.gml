
var _keyInventory = keyboard_check_released(global.inventory_key);
var _keyEscape = keyboard_check_released(vk_escape);
var _keyPlace = keyboard_check_released(global.place_key);

if(!typing) {
	var vertMove = keyboard_check(ord("S")) - keyboard_check(ord("W"))
	var horzMove = keyboard_check(ord("D")) - keyboard_check(ord("A"))
} else {
	var vertMove = 0;
	var horzMove = 0;
}

if(oHealth <= 0) {
	player_died();
	oHealth = oMaxHealth
}

if(invincibilityTimer > 0) {
	invincibilityTimer--;
	if(invincibilityTimer <= invincibilityTimeMax - flashForFrames) isHurt = false;
}

// Inventory
if(oInventory.opened == false && _keyInventory && !typing) {
	oInventory.opened = true;
	oHotbar.shown = false;
} else if(oInventory.opened == true && (_keyEscape || _keyInventory) && !typing) {
	oInventory.opened = false;
	oHotbar.shown = true;
}

//check for movement
if (vertMove != 0 || horzMove != 0) {
    animationState = "walk";
} else {
    animationState = "idle";
}

// Play the correct animation
switch (animationState) {
    case "idle":
        sprite_index = sPlayerIdle;
        break;
    case "walk":
        sprite_index = sPlayerWalking;
        break;
}

// Flip player sprite direction
if(horzMove > 0) {
	image_xscale = 3;
} else if(horzMove < 0) {
	image_xscale = -3;
}

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
	if(point_distance(x,y,oPlayer.x,oPlayer.y + oPlayer.sprite_height / 2) < strength) {
		other.isInsideLight = true;	
	}
}

// Place held item
if(_keyPlace && !typing) {
	if(!place_meeting(x,y,global.collision_objects)) {
		if(holding != undefined) {
			if(holding.options.isPlaceable) {
				instance_create_layer(x,y, "Instances",  holding.options.object);
				oInventory.inventory.item_subtract(holding.name, 1);
			}
		}
	}
}

// End held item animation if at end animation
if (holding != undefined && sprite_frame >= sprite_get_number(holding.options.sprite) - 1) {
    sprite_frame = 0;
	if(!holding.options.loopAnimation) sprite_playing_animation = false;
} else if(holding != undefined && sprite_playing_animation) {
	if(animation_step_delay >= sprite_get_speed(holding.options.sprite)) {
		sprite_frame++;
		animation_step_delay = 0;
	} else {
		animation_step_delay++;	
	}
}
 
// Check if player is behind collision_alpha_objects 
isBehindEnviromentalObject = false;
for(i = 0; i < array_length(global.collision_alpha_objects); i++) {
	with(global.collision_alpha_objects[i]) {
		for(c = 0; c < ds_list_size(collisions); c++) {
			if(instance_exists(ds_list_find_value(collisions, c)) && ds_list_find_value(collisions, c).id == other.id) {
				other.isBehindEnviromentalObject = true;
			}
		}
	}
}

// If player IS behind collision_alpha_objects, lower alpha.
// If not, set alpha to 1
if(isBehindEnviromentalObject) {
	image_alpha = 0.60;
} else {
	image_alpha = 1;
}

if(!oInventory.opened && holding != undefined && mouse_check_button_pressed(mb_left)) {
	isAttacking	= true;
}

if(isAttacking) {
	sprite_playing_animation = true;
	isAttacking = false;
	
	if(holding.options.isAttackable) {
		if(holding.options.attackType == AttackType.MELEE) {
			
			cBox = instance_create_layer(x,y + holding.options.y_offset,"Instances", oCollisionBox);
			
			cBox.width = holding.options.attackWidth
			cBox.height = holding.options.attackHeight;
			cBox.facing = sign(image_xscale);
			cBox.knockback_strength = holding.options.knockbackStrength;
			cBox.damage = holding.options.attackDamage;
			
			if(sprite_frame == 0) audio_play_sound(swing, 1, false);
			
		} else if(holding.options.attackType == AttackType.RANGED) {
			// No time to add this :(
		}
	} else if(holding.options.isConsumable){
		if(holding.name == "bandages") {
			healingAmount = 5;
			oInventory.inventory.item_subtract("bandages", 1);
			heal_object(self, healingAmount);
			showMessage($"Healed for {healingAmount} health");
		}
	}
}

   