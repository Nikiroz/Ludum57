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
	
	if(!audio_is_playing(snd_boat_start)){
		audio_play_sound(snd_boat_start,1,false,global.soundVoulme);
	}
	
	if(!audio_is_playing(snd_boat_enginge_loop)){
		audio_play_sound(snd_boat_enginge_loop, 1, true, global.soundVoulme);		
	}
}
else {
	sprite_index = s_father_drive_end;
	with(o_ship_winch_basic){
		event_user(0);	
	}
	if(audio_is_playing(snd_boat_enginge_loop)){
		audio_stop_sound(snd_boat_enginge_loop);
	}
	
	if(!audio_is_playing(snd_boat_stop)){
		audio_play_sound(snd_boat_stop, 1, false, global.soundVoulme);
	}
}
		
event_user(1);
