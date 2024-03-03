global.interact_key = ord("F");
global.inventory_key = ord("E");
global.place_key = vk_space;

global.collision_objects = [oBigTree1, oBigTree2, oPlane, oCampFire, oBigBoulder];
global.environment_interactable_objects = [oPlayer, oCannibal];
global.collision_alpha_objects = [oBigTree1, oBigTree2, oBigBoulder];

global.messages = [];


// Create grid that enemies will use to move
global.grid_id = mp_grid_create(0, 0, ceil(room_width/5), ceil(room_height/5), 5, 5);
for(i = 0; i < array_length(global.collision_objects); i++) {
	mp_grid_add_instances(global.grid_id, global.collision_objects[i], true);
}

with(oCampFire) {
	_x = x - strength;
	_y = y - strength;

	for(_w = 0; _w < strength * 2; _w++) {
		for(_h = 0; _h < strength * 2; _h++) {
			if(point_distance(_x + _w, _y + _h, x, y) < strength ) {
				mp_grid_add_rectangle(global.grid_id, _x + _w, _y + _h, _x + _w, _y + _h);
			}
		}
	}
}
	
updateGridSteps = 20;
updateGridCurrentStep = 0;
