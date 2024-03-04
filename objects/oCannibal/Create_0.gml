oHealth = 10;

_hurtBox = instance_create_layer(x,y, "Instances", oHurtBox);
_hurtBox.owner = self;
_hurtBox.width = sprite_width - 30;
_hurtBox.height = sprite_height - 10;
_hurtBox.x_offset = _hurtBox.width / 2 * -1;
_hurtBox.y_offset = _hurtBox.height / 2 * -1;

isBehindEnviromentalObject = false;

eWanderingSpeed = 0.5;
eHuntingSpeed = 1.0;

path = noone;

state = eState.arrived;
pos = 1;

enum eState {
	wandering,
	arrived,
	hunting
}
