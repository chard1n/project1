if(updateGridCurrentStep >= updateGridSteps) {
	
	mp_grid_destroy(grid_id);
	
	grid_id = mp_grid_create(0, 0, ceil(room_width/5), ceil(room_height/5), 5, 5);
	for(i = 0; i < array_length(global.collision_objects); i++) {
		mp_grid_add_instances(grid_id, global.collision_objects[i], true);
	}

	with(oCampFire) {
		radius = strength - 5; // Account for cell size
		for (var _angle = 0; _angle < 360; _angle += 1) {
        _x_on_circle = x + lengthdir_x(radius, _angle);
        _y_on_circle = y + lengthdir_y(radius, _angle);

        mp_grid_add_rectangle(other.grid_id, x, y, _x_on_circle, _y_on_circle);
		}
	}
	updateGridCurrentStep = 0;
}

if((distance_to_object(oPlayer) > 320 || oPlayer.isInsideLight ) && (state == eState.hunting || state == eState.arrived)) {
	if(path_exists(path)) path_delete(path);
	
	state = eState.wandering;
	
	path = path_add();
	
	goX = random(room_width);
	goY = random(room_height);


	mp_grid_path(grid_id, path, x, y + sprite_height / 2 - 5, goX, goY , true);
	
	pos = 1;

} else if(distance_to_object(oPlayer) <= 320 && !oPlayer.isInsideLight) {
	if(path_exists(path)) path_delete(path);
	
	state = eState.hunting;
	
	path = path_add();
	
	mp_grid_path(grid_id, path, x, y + sprite_height / 2 - 5, oPlayer.x, oPlayer.y + oPlayer.sprite_height / 2 - 5, true);

	pos = 1;

}

if(path_exists(path) && path_get_length(path) != 0) {
	
	x_goto = path_get_point_x(path, pos);
	y_goto = path_get_point_y(path, pos);

	if (point_distance(x, y + sprite_height / 2 - 5, x_goto, y_goto) < 8 || path_get_number(path) == 0 )
	{
	if (++pos == path_get_number(path) )
	    {
			if(path_exists(path)) path_delete(path);

			state = eState.arrived;
			
	    }
	else
	    {
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


	mp_grid_path(grid_id, path, x, y + sprite_height / 2 - 5, goX, goY , true);
	
	
	pos = 1;
}

updateGridCurrentStep++;


