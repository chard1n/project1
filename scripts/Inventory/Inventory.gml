function Inventory() constructor {
	
	inventory_columns = 9;
	inventory_rows = 6;
	
	_inventory_items = array_create(inventory_columns * inventory_rows, noone);
	
	get_width = function() {
		return inventory_columns;
	}
	
	get_height = function() {
		return inventory_rows;
	}
	
	item_set = function(_name, _quantity, _held) {
		_inventory_items[find_open_index()] = {
			name: _name,
			quantity: _quantity,
			options: _held,
		};
	}
	
	find_open_index = function() {
		for (var i = 0; i < array_length(_inventory_items); i++) {
			if(_inventory_items[i] == noone) {
				return i;
			}
		}
	}
	
	item_get_from_index = function(_index) {
		if(_index < 0) return noone;
		if(_inventory_items[_index] == noone) return noone;
		return _inventory_items[_index];
	}
	
	item_find = function(_name) {
		for (var i = 0; i < array_length(_inventory_items); i++) {
			if(_inventory_items[i] != noone && _name == _inventory_items[i].name) {
				return i;
			}
		}
		
		return -1;
	}
	
	item_move = function(_name, _index) {
		original_idx = item_find(_name);
		// Check if item exists
		if(original_idx < 0) return;
		
		// Check if new index is empty
		if(_inventory_items[_index] != noone) return;
		
		_inventory_items[_index] = _inventory_items[original_idx];
		_inventory_items[original_idx] = noone;
	}
	
	item_add = function(_name, _quantity) {
		var index = item_find(_name);
		
		if(index >= 0) {
			_inventory_items[index].quantity += _quantity;
		} else {
			
			item_set(_name, _quantity, get_item_options(_name));
		}
		return item_get_from_index(item_find(_name));
	}
	
	item_subtract = function(_name, _quantity) {
		var index = item_find(_name);
		
		if(index >= 0) {
			if(item_has(_name, _quantity)) {
				_inventory_items[index].quantity -= _quantity;
				
				if(_inventory_items[index].quantity <= 0) {
					item_remove(index);
				}
			}
		}
		return item_get_from_index(item_find(_name));
	}
	
	item_has = function(_name, _quantity) {
		var index = item_find(_name);
		
		if(index >= 0) {
			return _inventory_items[index].quantity >= _quantity;
		}
		
		return false;
	}
	
	item_remove = function(index) {
		_inventory_items[index] = noone;
	}
	
	clear = function() {
		_inventory_items = array_create(inventory_columns * inventory_rows, noone);
	}
	
	item_get = function() {
		return _inventory_items;
	}
	
	toString = function() {
		return json_stringify(_inventory_items);
	}
	
	/*
	validateHeldJson = function(_json) {
		requiredJson = { object: noone, isPlaceable: false, x_scale: 1, y_scale: 1, x_offset: 0, y_offset: 0, rotation: 0 };
		requiredKeys = variable_struct_get_names(requiredJson);
		keys = variable_struct_get_names(_json);

		for(i = 0; i < array_length(requiredKeys); i++) {
			if(!array_contains(keys,requiredKeys[i])) { // Json doesn't have a required key! :(
				struct_set(_json, requiredKeys[i], variable_struct_get(requiredJson, requiredKeys[i]));
			}
		}
		show_debug_message(_json);
		
		return _json;
	}
	*/

}