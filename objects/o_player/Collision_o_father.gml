if keyboard_check_pressed(ord(actionKey))
{
	status.isFreeze = !status.isFreeze;
	
	if (status.isFreeze) {
		sprite_index = s_player_drive_start;
	}
	else sprite_index = s_player_drive_end;
	
	
	with (other) {
		boatControl = !boatControl
		if (boatControl)
			sprite_index = s_father_drive_start;
		else sprite_index = s_father_drive_end;
	}
}