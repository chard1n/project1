function player_died() {
	_x = oPlayer.x;
	_y = oPlayer.y;
	
	grave = instance_create_layer(_x, _y, "Instances", oGrave);

	_inventory_items = oInventory.inventory.item_get();
	_items = [];
	
	for(i = 0; i < array_length(_inventory_items); i++) {
		if(_inventory_items[i] == noone) continue;
		
		array_push(_items, _inventory_items[i]);
		
	}

	grave.stored_items = _items;
	
	instance_create_layer(0,0, "Overlay", oTransition);
	
	startDialogue("PlayerDied");
	
	oInventory.inventory.clear();
	
	oPlayer.x = global.spawnPointX;
	oPlayer.y = global.spawnPointY;
	
}