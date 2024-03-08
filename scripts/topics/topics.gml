function setTopics(){

	global.topics[$ "StartTutorial"] = [
	
	
		TEXT("*You have just crash landed on a strange island..*"),
		TEXT("You might want to take a look around. See if you can find anything on the plane that could help you."),
	
	];

	global.topics[$ "OpenInventory"] = [
	
		TEXT("You collected an old pocketknife..."),
		TEXT($"To open your inventory, press \"{keytostring(global.inventory_key)}\". Click and move items into your hotbar to use them."),
		TEXT($"To attack with a pocketknife, pickaxe, axe, or boneclub, press \"Left Mouse Button\"."),
		
	];

	global.topics[$ "PlayerDied"] = [
	
		TEXT("You died!"),
		TEXT("Go back to your death location to collect your items."),

	];
	
	global.topics[$ "TransponderActivated"] = [
		TEXT("Calling for help..."),
		TEXT("..."),
		TEXT("Help has been contacted! They will arive at the beach"),
	];
	
	global.topics[$ "PressToPlaceHelp"] = [
		TEXT($"You have crafted a placeable item. Press \"{keytostring(global.place_key)}\" to place this item down"),
	];
	
	global.topics[$ "GetInBoat"] = [
	];
	
	global.topics[$ "MysteriousTent"] = [
		TEXT("*You look inside the tent and find a book.*"),
		TEXT("The book has a human eye on the front cover..."),
		TEXT("You flip to the first page, where the word 'ABSUM_' is written in red.."),
		TEXT("*You might need this, you take it just in case"),
		
	];

}