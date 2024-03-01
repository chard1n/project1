path = pointer_null
grid_id = mp_grid_create(0, 0, room_width/5, room_height/5, 5, 5);
pos = 1;

for(i = 0; i < array_length(global.collision_objects); i++) {
	mp_grid_add_instances(grid_id, global.collision_objects[i], true);
}
