if (timer <= 0) {
	player = instance_find(oPlayer, 0); 
	dist = point_distance(x, y, player.x, player.y);

	if(dist > spawn_distance_from_player && instance_number(oCannibal) < global.max_cannibal_amount) {
	    var enemy = instance_create_layer(x, y, "Instances", oCannibal);
	    enemy.image_xscale = 3; 
	    enemy.image_yscale = 3; 
		
		show_debug_message("Distance to Player: " + string(dist));
	}
	
    timer = spawn_interval; 
	
} else {
    timer -= 1; 
}