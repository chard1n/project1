// Check if cannibal is behind collision_alpha_objects 
isBehindEnviromentalObject = false;
for(i = 0; i < array_length(global.collision_alpha_objects); i++) {
	with(global.collision_alpha_objects[i]) {
		for(c = 0; c < ds_list_size(collisions); c++) {
			if(ds_list_find_value(collisions, c).id == other.id) {
				other.isBehindEnviromentalObject = true;
			}
		}
	}
}

// If cannibal IS behind collision_alpha_objects, lower alpha.
// If not, set alpha to 1
if(isBehindEnviromentalObject) {
	image_alpha = 0.60;
} else {
	image_alpha = 1;
}

if((distance_to_object(oPlayer) > 320 || oPlayer.isInsideLight ) && (state == eState.hunting || state == eState.arrived)) {
	if(path_exists(path)) path_delete(path);
	
	state = eState.wandering;
	
	path = path_add();
	
	goX = random(room_width);
	goY = random(room_height);


	mp_grid_path(global.grid_id, path, x, y + sprite_height / 2 - 5, goX, goY , true);
	
	pos = 1;

} else if(distance_to_object(oPlayer) <= 320 && !oPlayer.isInsideLight) {
	if(path_exists(path)) path_delete(path);
	
	state = eState.hunting;
	
	path = path_add();
	
	mp_grid_path(global.grid_id, path, x, y + sprite_height / 2 - 5, oPlayer.x, oPlayer.y + oPlayer.sprite_height / 2 - 5, true);

	pos = 1;

}

if(path_exists(path) && path_get_length(path) != 0) {
			
	x_goto = path_get_point_x(path, pos);
	y_goto = path_get_point_y(path, pos);

	if (point_distance(x, y + sprite_height / 2 - 5, x_goto, y_goto) < 8 || path_get_number(path) == 0 )
	{
		if (++pos == path_get_number(path) ) {
			if(path_exists(path)) path_delete(path);

			state = eState.arrived;
		} else {
			x_goto = path_get_point_x(path, pos);
			y_goto = path_get_point_y(path, pos); 
		}
	}
	
	if(state == eState.wandering) {
		mp_linear_step(x_goto, y_goto - sprite_height / 2 + 5, eWanderingSpeed, false);
	} else if(state == eState.hunting) {
		mp_linear_step(x_goto, y_goto - sprite_height / 2 + 5, eHuntingSpeed, false);
	}
} else {
	
	if(path_exists(path)) path_delete(path);
	// Choose random spot if path doesn't exist
	y -= 1;
	
	state = eState.wandering;
	
	path = path_add();
	
	goX = random(room_width);
	goY = random(room_height);


	mp_grid_path(global.grid_id, path, x, y + sprite_height / 2 - 5, goX, goY , true);
	
	
	pos = 1;
}



