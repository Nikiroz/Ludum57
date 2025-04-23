/// @description Эмбиент

if(!audio_is_playing(snd_ambience_waves)){
	audio_play_sound_on(global.soundEmitter, snd_ambience_waves, true, 1);
	audio_sound_gain(snd_ambience_waves, 0, 0);
}

if(audio_is_playing(snd_ambience_waves)){
	var _underwaterGain = underwater ? 0 : 1;
	audio_sound_gain(snd_ambience_waves, _underwaterGain, 0);
}

if(!audio_is_playing(snd_underwater_loop)){
		
	audio_play_sound_on(global.soundEmitter, snd_underwater_loop, true, 1);
	audio_sound_gain(snd_underwater_loop, 0, 0);
}

if(audio_is_playing(snd_underwater_loop)){
	var _underwaterGain = underwater ? 1 : 0;
	audio_sound_gain(snd_underwater_loop, _underwaterGain, 0);
		
}

if(instance_exists(o_game_controller)){
	
	if(!audio_is_playing(snd_ambience_night) && !underwater && o_game_controller.hour > 20){
	
		audio_play_sound_on(global.soundEmitter, snd_ambience_night, true, 1);
		audio_sound_gain(snd_ambience_night, 0, 0);
		audio_sound_gain(snd_ambience_night, 1, 3000);
		
	}
	
	if(audio_is_playing(snd_ambience_night)){
		if(o_game_controller.hour > 20 || o_game_controller.hour < 6){
			if(underwater){
				audio_sound_gain(snd_ambience_night, 0, 0);
			} else {
				audio_sound_gain(snd_ambience_night, 1, 0);
			}
		} else {
			audio_stop_sound(snd_ambience_night)
		}
	}

}
