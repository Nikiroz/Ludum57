hsp = 0;
vsp = 0;

event_inherited();

hsp = 0;
vsp = 0;

if (boatControl)
{
	var left = keyboard_check(ord(leftKey)),
		right = keyboard_check(ord(rightKey)),
		
	with (o_boatController)
	{
		boatSpeed = lerp(boatSpeed, (right - left), 0.1);
	}
}
else with (o_boatController) boatSpeed = lerp(boatSpeed, 0, 0.1);