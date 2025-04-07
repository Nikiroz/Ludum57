/// @description Взаимодействие
with (interactor)
{
	walking_enabled = !walking_enabled;
	
	if (walking_enabled) {
		sprite_index = s_player_drive_start;
	}
	else {
		sprite_index = s_player_drive_end;
	}
	
	with (other) {
		boatControl = !boatControl
		
		if (boatControl) {
			sprite_index = s_father_drive_start;
		}
		else {
			sprite_index = s_father_drive_end;
		}
		
		event_user(1);
	}
}