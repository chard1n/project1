//get input
var confirm = keyboard_check_pressed(global.confirm_key);

text_progress = min(text_progress + text_speed, text_length);

if(input_delay > 0){
	input_delay--;
	exit;
}

if(text_progress == text_length){
	if(confirm){
		next();
	}
}
else if(confirm){
	text_progress = text_length;
}