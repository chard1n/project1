function setTopics(){

	global.topics[$ "StartTutorial"] = [
	
	
		TEXT("*You have just crash landed on a strange island..*"),
		TEXT("You might want to take a look around. See if you can find anything on the plane that could help you."),
	
	];

	global.topics[$ "OpenInventory"] = [
	
		TEXT("You collected an old pocketknife..."),
		TEXT($"To open your inventory, press \"{keytostring(global.inventory_key)}\". Click and move items into your hotbar to use them."),

	];

	global.topics[$ "PlayerDied"] = [
	
		TEXT("You died!"),
		TEXT("Go back to your death location to collect your items."),

	];

}