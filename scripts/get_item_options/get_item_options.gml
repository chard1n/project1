function get_item_options(argument0){
	value = {};
	switch(argument0) {
		
		case "boneClub":
			value = { sprite: sBoneClub, displayName: "Bone Club", isAttackable: true, attackType: AttackType.MELEE, attackDamage: 2.5, attackWidth: 32, knockbackStrength: 32.0, attackHeight: 16, x_scale: 0.8, y_scale: 0.8, x_offset: 10, y_offset: 15 };
			break;
		case "pickaxe":
			value = { sprite: sPickaxe, displayName: "Pickaxe", isAttackable: true, attackType: AttackType.MELEE, attackDamage: 1.0, knockbackStrength: 64.0, attackWidth: 64, attackHeight: 64, x_scale: 0.8, y_scale: 0.8, x_offset: 15, y_offset: 10 };
			break;
		case "axe":
			value = { sprite: sAxe, displayName: "Axe", x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0 };
			break;
		case "bone":
			value = { sprite: sBone, displayName: "Bone", x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0 };
			break;
		case "campFire":
			value = { sprite: sCampFire, displayName: "Campfire", object: oCampFire, isPlaceable: true, x_scale: 0.8, y_scale: 0.8, x_offset: 10, y_offset: 15, playAnimationByDefault: true, loopAnimation: true };
			break;
		case "electronicParts":
			value = { sprite: sElectronicParts, displayName: "Electronic Parts", x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0 };
			break;
		case "phone":
			value = { sprite: sPhone, displayName: "Phone", x_scale: 0.8, y_scale: 0.8, x_offset: 15, y_offset: 13 };
			break;
		case "pocketknife":
			value = { sprite: sPocketKnife, displayName: "Pocketknife", x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0 };
			break;
		case "rock":
			value = { sprite: sRock, displayName: "Rock", x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0 };
			break;
		case "skull":
			value = { sprite: sSkull, displayName: "Skull", x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0 };
			break;
		case "stick":
			value = { sprite: sStick, displayName: "Stick", x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0 };
			break;
		case "wood":
			value = { sprite: sWood, displayName: "Wood", x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0 };
			break;
	
	}
	return validateJson(value);
}

function validateJson(_json) {
		requiredJson = { sprite: sDoesNotExists, displayName: "", object: noone, isPlaceable: false, isAttackable: false, attackType: AttackType.NONE, attackDamage: 0.0, knockbackStrength: 0.0, attackWidth: 1, attackHeight: 1, x_scale: 1, y_scale: 1, x_offset: 0, y_offset: 0, rotation: 0, loopAnimation: false, playAnimationByDefault: false, loopAnimation: false  };
		requiredKeys = variable_struct_get_names(requiredJson);
		keys = variable_struct_get_names(_json);

		for(i = 0; i < array_length(requiredKeys); i++) {
			if(!array_contains(keys,requiredKeys[i])) { // Json doesn't have a required key! :(
				struct_set(_json, requiredKeys[i], variable_struct_get(requiredJson, requiredKeys[i]));
			}
		}
		
		return _json;
}