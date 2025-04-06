if (boatControl)
{
	var left = keyboard_check(ord(leftKey)),
		right = keyboard_check(ord(rightKey)),
		
	with (o_boatController)
	{
		boatSpeed += (right - left) / 3;
	}
}