player = instance_find(oPlayer, 0); 
dist = point_distance(x, y, player.x, player.y);

if (timer <= 0 && dist > spawn_distance_from_player) {
    var enemy = instance_create_layer(x, y, "Instances", oCannibal);
    enemy.image_xscale = 3; 
    enemy.image_yscale = 3; 
    timer = irandom_range(60, 120); 
} else {
    timer -= 1; 
}
show_debug_message("Distance to Player: " + string(dist));