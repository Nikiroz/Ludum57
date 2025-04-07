/// @description Взаимодействие
with (interactor)
{
	walking_enabled = !walking_enabled;
	
	if (!walking_enabled) {
		sprite_index = s_player_drive_start;
		facing = 1;
	}
	else {
		sprite_index = s_player_drive_end;
	}
	
	x = other.x - 20;
	
}


boatControl = !boatControl
		
if (boatControl) {
	sprite_index = s_father_drive_start;
	with(o_ship_winch_basic){
		event_user(1);	
	}
	
}
else {
	sprite_index = s_father_drive_end;
	with(o_ship_winch_basic){
		event_user(0);	
	}

}
		
event_user(1);
