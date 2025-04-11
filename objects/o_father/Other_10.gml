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

	if(!audio_is_playing(snd_boat_start2)){
		audio_play_sound_on(global.soundEmitter, snd_boat_start2, false, 1);
		alarm[0] = 30;
	}

}
else {
	sprite_index = s_father_drive_end;
	
	if(audio_is_playing(snd_boat_enginge_loop)){
		audio_stop_sound(snd_boat_enginge_loop);
	}
	
	if(!audio_is_playing(snd_boat_stop)){
		audio_play_sound_on(global.soundEmitter, snd_boat_stop, false, 1);
	}

}
		
event_user(2);
