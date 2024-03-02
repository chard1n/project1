display_time -= 1; // Decrease the display time
if (display_time <= 0) {
    instance_destroy(); 
	array_delete(global.messages, 0, 1); // Removes self (Index 0)	
} else if (display_time <= 20) {
	alpha -= 0.05;	
}