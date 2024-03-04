// Please do not look at this file I have no idea what I have created I am so sorry
// for whoever tries to debug this I don't know what any of it does anymore

function knockback_object(obj, kb_strength = 0){
	if(instance_exists(obj)) {
		canSee = false; 
		
		dir = point_direction(oPlayer.x,oPlayer.y,obj.x,obj.y);
		
		dirX = lengthdir_x(kb_strength, dir);
		dirY = lengthdir_y(kb_strength, dir);

		collisionX = obj.x - (obj.x - obj.bbox_left)
		collisionY = obj.y + (obj.bbox_top - obj.y)
		collisionWidth = (obj.bbox_right - obj.bbox_left)
		collisionHeight = (obj.bbox_bottom - obj.bbox_top)

		col = collision_rectangle(collisionX + dirX, collisionY + dirY, collisionX + collisionWidth + dirX, collisionY + collisionHeight + dirY, global.collision_objects, false, false)

		canSee = collision_line(collisionX + dirX + collisionWidth / 2, collisionY + dirY + collisionHeight / 2, collisionX + collisionWidth / 2, collisionY + collisionHeight / 2, global.collision_objects, false, false) ? false : true;

		if(!col && canSee) {
			obj.x += dirX;
			obj.y += dirY;
		} else {
			runs = 0;
			while((col || !canSee) && runs < 50) {
				if(dirX > 0) {
					dirX = dirX - 1;
				} else {
					dirX = dirX + 1;
				}
				
				if(dirY > 0) {
					dirY = dirY - 1;
				} else {
					dirY = dirY + 1;
				}
				
				col = collision_rectangle(collisionX + dirX, collisionY + dirY, collisionX + collisionWidth + dirX, collisionY + collisionHeight + dirY, global.collision_objects, false, false)
				
				canSee = false; 
				
				if(!col) {
					canSee = collision_line(collisionX + dirX + collisionWidth / 2, collisionY + dirY + collisionHeight / 2, collisionX + collisionWidth / 2, collisionY + collisionHeight / 2, global.collision_objects, false, false) ? false : true;
				}

				runs++;
			}
			
			if(!col && canSee) {
				obj.x += dirX;
				obj.y += dirY;	
			}
		}

	}
}