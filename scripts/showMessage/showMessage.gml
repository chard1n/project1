
function showMessage(){
	message_obj = instance_create_layer(x, y, layer, oMessage); // Create the message object
	message_obj.message_text = argument0; 
}