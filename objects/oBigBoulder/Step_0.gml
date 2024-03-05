if(collisions) ds_list_destroy(collisions);
collisions = ds_list_create();

coll_rect_bigBoulder = collision_rectangle_list(x, y, x+sprite_width, y+sprite_height, global.environment_interactable_objects, false, true, collisions, false);