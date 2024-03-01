if(coll_rect_bigBoulder) {
	isColliding = true;
	image_alpha = 0.60;
	if(coll_rect_bigBoulder) {
		coll_rect_bigBoulder.image_alpha = 0.50;
	}
	draw_self();
} else if(isColliding) {
	isColliding = false;
	image_alpha = 1.0;
	for(i = 0; i < array_length(global.environment_interactable_objects); i++) {
		global.environment_interactable_objects[i].image_alpha = 1.0;
	}
	draw_self();
} else {
	draw_self();
}