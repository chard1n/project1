if (timer <= 0 && dist > spawn_distance_from_player) {
	player = instance_find(oPlayer, 0); 
	dist = point_distance(x, y, player.x, player.y);

    var enemy = instance_create_layer(x, y, "Instances", oCannibal);
    enemy.image_xscale = 3; 
    enemy.image_yscale = 3; 
    timer = irandom_range(60, 120); 
	
	show_debug_message("Distance to Player: " + string(dist));
} else {
    timer -= 1; 
}