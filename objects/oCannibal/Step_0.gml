path = path_add();

mp_grid_path(grid_id, path, x, y + sprite_height / 2 - 5, oPlayer.x, oPlayer.y + oPlayer.sprite_height / 2 - 10, true);

pos = 1;

if(path != pointer_null) {
	
	x_goto = path_get_point_x(path, pos);
	y_goto = path_get_point_y(path, pos) - sprite_height / 2 + 5;
	
	show_debug_message(string(point_distance(x, y + sprite_height / 2 - 5, x_goto, y_goto)));

	if (point_distance(x, y + sprite_height / 2 - 5, x_goto, y_goto) < 8 || path_get_number(path) == 0 )
	{
	if (++pos == path_get_number(path) || path_get_number(path) == 0 )
	    {
			path_delete(path);
			path = pointer_null;

			//instance_destroy();
	    }
	else
	    {
	    x_goto = path_get_point_x(path, pos);
	    y_goto = path_get_point_y(path, pos); 
	    }
	}
	
	mp_linear_step(x_goto, y_goto, 1, false);
}