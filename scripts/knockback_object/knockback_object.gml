function knockback_object(obj, kb_strength = 0){
	if(instance_exists(obj)) {
		dir = point_direction(oPlayer.x,oPlayer.y,obj.x,obj.y);
		
		dirX = lengthdir_x(kb_strength, dir);
		dirY = lengthdir_y(kb_strength, dir);
		
		if(!place_meeting(obj.x + dirX, obj.y, global.collision_objects)) {
			obj.x += dirX;
		}
		
		if(!place_meeting(obj.x, obj.y + dirY, global.collision_objects)) {
			obj.y += dirY;
		}
	}
}