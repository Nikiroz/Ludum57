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
	startEngine = true;
	alarm[0] = 60;	
	
	if(audio_is_playing(snd_boat_start2)){
		audio_stop_sound(snd_boat_start2);	
	}
	
	if(!audio_is_playing(snd_boat_start2)){
		audio_play_sound_on(o_boatSound.emitter, snd_boat_start2, false, 1);
	}
		
}
else {
	
	sprite_index = s_father_drive_end;
	startEngine = false;
	alarm[0] = -1;
	
	if(audio_is_playing(snd_boat_start2)){
		audio_stop_sound(snd_boat_start2);	
	}
	
	if(audio_is_playing(snd_boat_stop)){
		audio_stop_sound(snd_boat_stop);	
	}
	
	if(!audio_is_playing(snd_boat_stop)){
		audio_play_sound_on(o_boatSound.emitter, snd_boat_stop, false, 1);
	}

}
		
event_user(2);
