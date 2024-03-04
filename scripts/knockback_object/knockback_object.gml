function knockback_object(obj, kb_strength = 0){
	if(instance_exists(obj)) {
		dir = point_direction(oPlayer.x,oPlayer.y,obj.x,obj.y);
		
		dirX = lengthdir_x(kb_strength, dir);
		dirY = lengthdir_y(kb_strength, dir);
		
		if(!place_meeting(obj.x + dirX, obj.y + dirY, global.collision_objects)) {
			obj.x += dirX;
			obj.y += dirY;
		}
	}
}