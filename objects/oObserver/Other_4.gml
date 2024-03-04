global.interact_key = ord("F");
global.inventory_key = ord("E");
global.place_key = vk_space;

global.collision_objects = [oBigTree1, oBigTree2, oPlane, oCampFire, oBigBoulder, oBorder];
global.environment_interactable_objects = [oPlayer, oCannibal];
global.collision_alpha_objects = [oBigTree1, oBigTree2, oBigBoulder];

global.messages = [];


// Create grid that enemies will use to move
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
	
updateGridSteps = 20;
updateGridCurrentStep = 0;
