if keyboard_check_pressed(ord(actionKey))
{
	status.isFreeze = !status.isFreeze;
	
	with (other) {
		boatControl = !boatControl
		if (boatControl)
			sprite_index = s_father_drive_start;
		else sprite_index = s_father_drive_end;
	}
}