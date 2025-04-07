event_inherited();

is_boated = true;

interaction2_active = o_player.aquasuit_equipped;

if (boatControl)
{
	var left = keyboard_check(ord(leftKey)),
		right = keyboard_check(ord(rightKey)),
	
	with (o_boatController)
	{
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

