collisions = ds_list_create();

isInteractable = true;
interact_message = "";
x_center = x + sprite_width / 2;
y_center = y + ( 25 * image_yscale);
y_message_offset = -50;
x_message_offset = 0;
interact_radius = 50;
doCollisionAlphaCheck = true;

has_been_interacted = false;