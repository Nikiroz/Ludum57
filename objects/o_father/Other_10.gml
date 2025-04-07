/// @description Взаимодействие
with (interactor)
{
	walking_enabled = !walking_enabled;
	
	if (!walking_enabled) {
		sprite_index = s_player_drive_start;
		hand_sprite = s_player_drive_hand_start;
		facing = 1;
	}
	else {
		sprite_index = s_player_drive_end;
		hand_sprite = s_player_drive_hand_end;
	}
	
	
	
}


boatControl = !boatControl
		
if (boatControl) {
	sprite_index = s_father_drive_start;
	with(o_ship_winch_basic){
		event_user(1);	
	}
	audio_play_sound(snd_boat_enginge_loop,1,true,global.soundVoulme);
}
else {
	sprite_index = s_father_drive_end;
	with(o_ship_winch_basic){
		event_user(0);	
	}
	audio_stop_sound(snd_boat_enginge_loop);
	audio_play_sound(snd_boat_stop, 1, false, global.soundVoulme);
}
		
event_user(1);
