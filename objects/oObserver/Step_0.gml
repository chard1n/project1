// Update grid
if(updateGridCurrentStep >= updateGridSteps) {
	mp_grid_destroy(global.grid_id);
	
	global.grid_id = mp_grid_create(0, 0, ceil(room_width/5), ceil(room_height/5), 5, 5);
	for(i = 0; i < array_length(global.collision_objects); i++) {
		mp_grid_add_instances(global.grid_id, global.collision_objects[i], true);
	}

	with(oCampFire) {
		radius = strength - 5; // Account for cell size
		for (var _angle = 0; _angle < 360; _angle += 1) {
			_x_on_circle = x + lengthdir_x(radius, _angle);
		    _y_on_circle = y + lengthdir_y(radius, _angle);

			mp_grid_add_rectangle(global.grid_id, x, y, _x_on_circle, _y_on_circle);
		}
	}
	updateGridCurrentStep = 0;
}

updateGridCurrentStep++;
	
	
if(keyboard_check_pressed(vk_f1)) {
	global.debug = global.debug ? false : true;
}

