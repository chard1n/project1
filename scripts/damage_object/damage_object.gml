function damage_object(obj, damage = 0){
	if(instance_exists(obj)) {
		if(variable_instance_exists(obj, "oHealth") && variable_instance_exists(obj, "invincibilityTimer") && variable_instance_exists(obj, "invincibilityTimeMax")) {
			if(obj.invincibilityTimer <= 0) {
				obj.oHealth -= damage;
				obj.isHurt = true;
				obj.invincibilityTimer = obj.invincibilityTimeMax;
			}
		} else {
			show_debug_message($"Object {obj} is missing a required variable for taking damage!");
		}
	}
}