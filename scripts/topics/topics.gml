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
	
	global.topics[$ "TransponderActivated"] = [
		TEXT("Calling for help..."),
		TEXT("..."),
		TEXT("Help has been contacted! They will arive at the beach"),
	];
	
	global.topics[$ "GetInBoat"] = [
		/*
		TEXT("Don't worry baby girl, daddy is here"),
		TEXT("*kisses*"),
		*/
	];
	
	global.topics[$ "MysteriousTent"] = [
		TEXT("*You found a green book. The cover has a human eye on it.."),
		TEXT("You open the book to the first page."),
		TEXT("All you see are scribbled over drawings with a strange word written in red."),
		TEXT("ABSUM"),
		TEXT("'Hm, I wonder what it means'"),
	]

}