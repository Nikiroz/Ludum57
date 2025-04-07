audio_listener_position(o_player.x, o_player.y, 0);
audio_listener_orientation(0,1,0,0,0,1);

underwater = o_player.y > mcr_waterline 

if(audio_is_playing(snd_underwater_loop)){
	var soundVolume = clamp(underwater, 0, global.soundVolume);
	audio_sound_gain(snd_underwater_loop, soundVolume, 0);
}

with(o_sound_static){
	if(soundLoop != -1){
		if(audio_is_playing(soundLoop)){
			audio_sound_gain(soundLoop, gain, 0);
		}
	}
}

if(audio_is_playing(snd_ambience_waves)){
	var soundVolume = clamp(!underwater, 0, global.soundVolume);
	audio_sound_gain(snd_ambience_waves, soundVolume, 0);
}

if(!o_father.boatControl){
	if(isStepPlay(global.soundBoatArray)){
		if(!underwater){
			audio_play_sound(getRandomSound(global.soundBoatArray), 100, false, global.soundVolume);
			alarm[0] = irandom(30);
		} else {
			alarm[0] = -1;
		}
	}
} else {
	if(audio_is_playing(snd_boat_enginge_loop)){
		
		audio_sound_gain(snd_boat_enginge_loop, global.soundVolume, 0);
	}	
}


if(!o_player.is_dead && o_player.oxygen < (o_player.oxygen_capacity * 0.15)){
	if(!audio_is_playing(snd_low_oxygen_choking_d)){
		audio_play_sound(snd_low_oxygen_choking_d, 1, true, global.soundVolume);
	}
}

if(isStepPlay(global.soundGameplayArray)){
	currentMusic = audio_play_sound(getRandomSound(global.soundGameplayArray), 100, false, global.musicVolume);
}
if(audio_is_playing(currentMusic)){
	audio_sound_gain(currentMusic, global.musicVolume, 0);
}