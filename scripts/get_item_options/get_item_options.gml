function get_item_options(argument0){
	switch(argument0) {
		
		case "boneClub":	return { object: noone, isPlaceable: false, x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0, rotation: 0, playAnimationByDefault: false, loopAnimation: false };
		case "bone":	return { object: noone, isPlaceable: false, x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0, rotation: 0, playAnimationByDefault: false, loopAnimation: false };
		case "campFire":	return { object: oCampFire, isPlaceable: true, x_scale: 0.8, y_scale: 0.8, x_offset: 10, y_offset: 15, rotation: 0, playAnimationByDefault: true, loopAnimation: true };
		case "electronicParts":	return { object: noone, isPlaceable: false, x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0, rotation: 0, playAnimationByDefault: false, loopAnimation: false };
		case "phone":	return { object: noone, isPlaceable: false, x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0, rotation: 0, playAnimationByDefault: false, loopAnimation: false };
		case "pocketKnife":	return { object: noone, isPlaceable: false, x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0, rotation: 0, playAnimationByDefault: false, loopAnimation: false };
		case "rock":	return { object: noone, isPlaceable: false, x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0, rotation: 0, playAnimationByDefault: false, loopAnimation: false };
		case "skull":	return { object: noone, isPlaceable: false, x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0, rotation: 0, playAnimationByDefault: false, loopAnimation: false };
		case "stick":	return { object: noone, isPlaceable: false, x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0, rotation: 0, playAnimationByDefault: false, loopAnimation: false };
		case "wood":	return { object: noone, isPlaceable: false, x_scale: 0.8, y_scale: 0.8, x_offset: 0, y_offset: 0, rotation: 0, playAnimationByDefault: false, loopAnimation: false };
		
		default:	return { object: noone, isPlaceable: false, x_scale: 1, y_scale: 1, x_offset: 0, y_offset: 0, rotation: 0, loopAnimation: false, playAnimationByDefault: false, loopAnimation: false  };
	}
}