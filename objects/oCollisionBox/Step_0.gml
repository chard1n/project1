with(oHurtBox) {
	if(is_overlap(x + x_offset,y + y_offset,x + width + x_offset, y + height + y_offset, other.x, other.y - other.height / 2, other.x + other.width * other.facing, other.y + other.height / 2)) {
			// TODO: Check to see if enemy is invulnerable before applying damage
			knockback_object(owner, other.knockback_strength);
			owner.oHealth -= other.damage;
		} 

}

instance_destroy();