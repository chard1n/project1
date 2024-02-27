if(coll_rect_leaves || coll_rect_trunk) {
	image_alpha = 0.75;
	oPlayer.image_alpha = 0.50;
	draw_self();
} else {
	image_alpha = 1.0;
	oPlayer.image_alpha = 1.0;
	draw_self();
}