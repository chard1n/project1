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
