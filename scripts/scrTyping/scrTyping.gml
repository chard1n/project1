function startDialogue(topic){
	if(instance_exists(oDialogBox))
	return;
	
	//spawn box
	var inst = instance_create_depth(x, y, -999, oDialogBox);
	inst.setTopic(topic);
}

function type(x, y, text, progress, width){
	var draw_x = 0;
	var draw_y = 0;
	
	//go through letters and grab character
	for(var i = 1; i <= progress; i++){
		var char = string_char_at(text, i);
		
		//line breaks
		if(char == "\n"){
			draw_x = 0;
			draw_y += string_height("A");
		}
		
		//if new word, line break
		else if(char == " "){
			draw_x += string_width(char);
			
			var word_width = 0;
			for(var j = i + 1; j <= string_length(text); j++){
				var word_char = string_char_at(text, j);
				
				//if the end, stop checking
				if(word_char == "\n" || word_char == " ")
				break;
				
				//move word to next line if it goes past boundary
				word_width += string_width(word_char);
				if(draw_x + word_width > width){
					draw_x = 0;
					draw_y += string_height("A");
					break;
				}
			}
		}
		
		else{	
		//draw the letter
		draw_text(x + draw_x, y + draw_y, char);
		draw_x += string_width(char);
		}
	}
}