function knockback_object(obj, kb_strength = 0){
	if(instance_exists(obj)) {
		dir = point_direction(oPlayer.x,oPlayer.y,obj.x,obj.y);
	
		obj.x += lengthdir_x(kb_strength, dir);
		obj.y += lengthdir_y(kb_strength, dir);
	}
}