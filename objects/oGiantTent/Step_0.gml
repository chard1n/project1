if(collisions) ds_list_destroy(collisions);
collisions = ds_list_create();

if(doCollisionAlphaCheck) {
	collision_rectangle_list(x + (10 * image_xscale), y + (25 * image_yscale), x + (55 * image_xscale), y + (55 * image_yscale), global.environment_interactable_objects, false, true, collisions, false);
	
}