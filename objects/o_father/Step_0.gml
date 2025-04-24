event_inherited();

interaction_active = !o_player.aquasuit_equipped;
interaction2_active = interaction_active;

if(!isEndDay){
	if (boatControl)
	{
		var left = keyboard_check(ord(leftKey)),
			right = keyboard_check(ord(rightKey));
	
		with (o_shipBG){
			if (x >= (room_width - 330)) {
				right = false;
			}
		}
	
		with (o_boatController)	{
			boatSpeed = lerp(boatSpeed, (right - left), 0.1);
		}
		with (o_player) {
			x = other.x - 16;
		}
	}
	else with (o_boatController)
	{
		boatSpeed = lerp(boatSpeed, 0, 0.1);
	}
}
else{
	with (o_boatController)	{
			boatSpeed = lerp(boatSpeed, 1, 0.1);
		}
	with (o_player) {
		x = other.x - 16;
	}
}
