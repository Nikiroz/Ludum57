/// @description Музыка


if(isStepPlay(global.musicGameplayArray)){
	musicAmbient = getRandomSound(global.musicGameplayArray);
	audio_play_sound_on(global.musicEmitter, musicAmbient, false, 1, 1);
}

if(instance_exists(o_player) && o_player.oxygen < (o_player.oxygen_capacity * 0.15)){
	
	if(!audio_is_playing(snd_mus_scavenger_deep_danger)){
		audio_play_sound_on(global.musicEmitter, snd_mus_scavenger_deep_danger, true, 1);
		audio_sound_gain(snd_mus_scavenger_deep_danger, 0, 0);
	}
	
	if(underwater){
		audio_sound_gain(musicAmbient, 0, 500);
		audio_sound_gain(snd_mus_scavenger_deep_danger, 1, 500);
	} else {
		audio_sound_gain(musicAmbient, 1, 500);
		audio_sound_gain(snd_mus_scavenger_deep_danger, 0, 500);
	}
	
} else {
	
	if(audio_is_playing(snd_mus_scavenger_deep_danger) && !global.isPause){
		audio_stop_sound(snd_mus_scavenger_deep_danger);
	}
	
}