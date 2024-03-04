if (global.debug) {
	draw_set_alpha(0.1);
	draw_set_colour(c_white);
	mp_grid_draw(global.grid_id);
	for (i = 0; i < room_width; i += 64) {
		draw_line_width(i, 0, i, room_height, 3);
	}
	for (j = 0; j < room_width; j += 64) {
		draw_line_width(0, j, room_width, j, 3);
	}
	draw_set_alpha(1);
	if (path_exists(path)) draw_path(path, x, y, true);
}

draw_self();

if (global.debug) {
	if(oPlayer.holding != undefined) {
		dir = point_direction(oPlayer.x,oPlayer.y,x,y);
		
		dirX = lengthdir_x(oPlayer.holding.options.knockbackStrength, dir);
		dirY = lengthdir_y(oPlayer.holding.options.knockbackStrength, dir);

		
		collisionX = x - (x - bbox_left)
		collisionY = y + (bbox_top - y)
		collisionWidth =   (bbox_right - bbox_left)
		collisionHeight =  (bbox_bottom - bbox_top)

		draw_set_color(c_red);
		draw_rectangle(collisionX + dirX, collisionY + dirY, collisionX + collisionWidth + dirX, collisionY + collisionHeight + dirY, false);
		
		draw_set_color(c_blue);

		draw_rectangle(collisionX, collisionY, collisionX + collisionWidth, collisionY + collisionHeight, false);
		
		draw_set_color(c_black);
		draw_line(collisionX + dirX + collisionWidth / 2, collisionY + dirY + collisionHeight / 2, collisionX + collisionWidth / 2, collisionY + collisionHeight / 2);
		draw_reset();
	}
}