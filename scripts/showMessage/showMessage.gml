
function showMessage(){
	message_obj = instance_create_layer(0, 0, layer, oMessage); // Create the message object
	array_push(global.messages, message_obj);
	message_obj.message_text = argument0; 
}