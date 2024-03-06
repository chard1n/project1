function Recipe() : Inventory() constructor {
	
	_recipies = [];
	
	recipe_sort = function() {
		_available_recipies = [];
		_disabled_recipies = [];
		for (var i = 0; i < array_length(_recipies); i++) {
			if(recipe_has(_recipies[i].name)) {
				array_push(_available_recipies, _recipies[i]);
			} else {
				array_push(_disabled_recipies, _recipies[i]);
			}
		}
		_recipies = array_concat(_available_recipies, _disabled_recipies);
	}
	
	recipe_find = function(_name) {
		for (var i = 0; i < array_length(_recipies); i++) {
			if(_name == _recipies[i].name) {
				return i;
			}
		}
		
		return -1;
	}
	
	recipe_add = function(_name, _requirement, _products, _sprite, _description = "") {
		array_push(_recipies, {
			name: _name,
			requirements: _requirement,
			products: _products,
			sprite: _sprite,
			description: _description,
		});
	}

	recipe_has = function(_name) {
		var index = recipe_find(_name);
		var can_craft = false;
		
		if(index >= 0) {
			can_craft = true;
			
			for(var requirement_index = 0; requirement_index < array_length(_recipies[index].requirements); requirement_index ++) {
				if(item_has(_recipies[index].requirements[requirement_index].name, _recipies[index].requirements[requirement_index].quantity) == false) {
					can_craft = false;
					break;
				}
			}
		}
		
		return can_craft;
	}
	
	recipe_craft = function(_name) {
		var index = recipe_find(_name);
		
		if(index >= 0) {
			if(recipe_has(_name)) {
				for(var requirement_index = 0; requirement_index < array_length(_recipies[index].requirements); requirement_index ++) {
					item_subtract(_recipies[index].requirements[requirement_index].name, _recipies[index].requirements[requirement_index].quantity);
				}
				
				for(var product_index = 0; product_index < array_length(_recipies[index].products); product_index++) {
					item_add(_recipies[index].products[product_index].name, _recipies[index].products[product_index].quantity, _recipies[index].products[product_index].sprite);
				}
			}
		}
	}
	
	recipe_get = function() {
		recipe_sort();
		return _recipies;
	}
}