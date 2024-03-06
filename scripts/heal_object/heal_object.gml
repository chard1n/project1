function heal_object(obj, healing = 0){
	if(instance_exists(obj)) {
		if(variable_instance_exists(obj, "oHealth") && variable_instance_exists(obj, "oMaxHealth") && variable_instance_exists(obj, "invincibilityTimer") && variable_instance_exists(obj, "invincibilityTimeMax")) {
			if(healing >= 0) {
				obj.oHealth = clamp(obj.oHealth + healing, 0, obj.oMaxHealth);
			} else {
				show_debug_message($"Cannot heal {obj.id} for {healing} healing!");
			}
		} else {
			show_debug_message($"Object {obj.id} is missing a required variable for healing!");
		}
	}
}