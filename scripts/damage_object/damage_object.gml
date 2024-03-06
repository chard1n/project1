function damage_object(obj, damage = 0){
	value = false;
	if(instance_exists(obj)) {
		if(variable_instance_exists(obj, "oHealth") && variable_instance_exists(obj, "oMaxHealth") && variable_instance_exists(obj, "isHurt") && variable_instance_exists(obj, "invincibilityTimer") && variable_instance_exists(obj, "invincibilityTimeMax")) {
			if(obj.invincibilityTimer <= 0) {
				obj.oHealth = clamp(obj.oHealth - damage, 0, obj.oMaxHealth);
				obj.isHurt = true;
				obj.invincibilityTimer = obj.invincibilityTimeMax;
				
				value = true;
			}
		} else {
			show_debug_message($"Object {obj.id} is missing a required variable for taking damage!");
		}
	}
	
	return value;
}