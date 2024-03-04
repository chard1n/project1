if(owner != noone) {
	if(!instance_exists(owner)) {
		instance_destroy();
		return;	
	}
	
	x = owner.x;
	y = owner.y;
}