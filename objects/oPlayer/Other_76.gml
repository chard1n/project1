show_debug_message("GOT BROADCAST MESSAGE");
show_debug_message(event_data[? "event_type"])
if (event_data[? "event_type"] == "sprite event") {
	show_debug_message(event_data[? "message"])
	switch (event_data[? "message"]) {
		case "create_attack_collision_box": {
			
			cBox = instance_create_layer(x,y,"Instances",oCollisionBox);
			cBox.width = 32;
			cBox.height = 32;
			break;
		}
	}
}
   