function setGlobalVariables(){
	global.interact_key = ord("F");
	global.inventory_key = ord("E");
	global.place_key = vk_space;
	global.confirm_key = vk_space;

	global.collision_objects = [oBigTree1, oBigTree2, oPlane, oCampFire, oBigBoulder, oBorder, oCopperRock];
	global.environment_interactable_objects = [oPlayer, oCannibal];
	global.collision_alpha_objects = [oBigTree1, oBigTree2, oBigBoulder, oBigBush, oCopperRock];

	global.messages = [];
	global.debug = false;
	
	global.topics = {};
	
	setTopics();
}