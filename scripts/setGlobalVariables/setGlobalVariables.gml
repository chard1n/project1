function setGlobalVariables(){
	global.interact_key = ord("F");
	global.inventory_key = ord("E");
	global.place_key = vk_space;
	global.confirm_key = vk_space;

	global.max_cannibal_amount = 30;

	global.collision_objects = [oBigTree1, oBigTree2, oPlane, oCampFire, oBigBoulder, oBorder, oCopperRock, oMetalRock, oCoalRock, oMysteriousTent, oGiantTent, oCrate, oTransponder];
	global.environment_interactable_objects = [oPlayer, oCannibal];
	global.collision_alpha_objects = [oBigTree1, oBigTree2, oBigBoulder, oCopperRock, oMetalRock, oGiantTent, oCoalRock, oMysteriousTent, oBigBush];

	global.messages = [];
	global.debug = false;
	
	global.topics = {};
	
	setTopics();
}