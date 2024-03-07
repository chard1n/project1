spawn_interval = 3600;
timer = spawn_interval
spawn_distance_from_player = 800;

player = instance_find(oPlayer, 0); 
dist = point_distance(x, y, player.x, player.y);