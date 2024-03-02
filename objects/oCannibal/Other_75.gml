
	grid_id = mp_grid_create(0, 0, ceil(room_width/5), ceil(room_height/5), 5, 5);
	for(i = 0; i < array_length(global.collision_objects); i++) {
		mp_grid_add_instances(grid_id, global.collision_objects[i], true);
	}

	with(oCampFire) {
		_x = x - strength;
		_y = y - strength;

		for(_w = 0; _w < strength * 2; _w++) {
			for(_h = 0; _h < strength * 2; _h++) {
				if(point_distance(_x + _w, _y + _h, x, y) < strength ) {
					mp_grid_add_rectangle(other.grid_id, _x + _w, _y + _h, _x + _w, _y + _h);
				}
			}
		}
	}
