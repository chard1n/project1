//Input
confirm_key = vk_space

//position
margin = 16
padding = 8
width = display_get_gui_width() - margin * 2;
height = sprite_height;

//center text
x = display_get_gui_width();
y = display_get_gui_height();

text_font = fn_menu;
text_color = c_white;
text_speed = 0.5;
text_x = padding;
text_y = padding;
text_width = width - padding * 2;

//DON'T EDIT!!
//store structs in array
actions = [];
current_action = -1;

text = ""
text_progress = 0 //how long it takes for text to present on screen;
text_length = 0;

setTopic = function(topic){
	actions = global.topics[$ topic];
	current_action = -1;
	
	next();
}

//move to next action, or close
next = function(){
	current_action++;
	if(current_action >= array_length(actions)){
		instance_destroy();
	}
	else{
		actions[current_action].act(id);
	}
}

//set text
setText = function(newText){
	text = newText;
	text_length = string_length(newText);
	text_progress = 0;
}