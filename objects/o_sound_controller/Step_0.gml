audio_listener_position(o_player.x, o_player.y, 0);
audio_listener_orientation(0,1,0,0,0,1);

underwater = o_player.y > mcr_waterline 

//фикс вебверсии

if(!audio_is_playing(snd_ambience_waves) && !underwater){
	
	if(audio_is_playing(snd_underwater_loop)){
		audio_stop_sound(snd_underwater_loop);
	}
	
	audio_play_sound(snd_ambience_waves, 1, true, global.soundVolume);
	
}


if(!audio_is_playing(snd_underwater_loop) && underwater){
	
	if(audio_is_playing(snd_ambience_waves)){
		audio_stop_sound(snd_ambience_waves);
	}
	
	audio_play_sound(snd_underwater_loop, 1, true, global.soundVolume);
	
}

with(o_sound_static){
	if(soundLoop != -1){
		if(audio_is_playing(soundLoop)){
			audio_sound_gain(soundLoop, gain, 0);
		}
	}
}

if(!o_father.boatControl){
	if(audio_is_playing(snd_boat_enginge_loop)){
		audio_stop_sound(snd_boat_enginge_loop);
	}
	
	if(isStepPlay(global.soundBoatArray)){
		if(!underwater){
			audio_play_sound(getRandomSound(global.soundBoatArray), 100, false, global.soundVolume);
			alarm[0] = irandom(30);
		} else {
			alarm[0] = -1;
		}
	}
} else {
	if(!audio_is_playing(snd_boat_stop) && o_father.startEngine){
		if(!audio_is_playing(snd_boat_enginge_loop)){
			audio_play_sound(snd_boat_enginge_loop, 1, true, global.soundVolume);
		} 
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

if(o_player.climb_aboard_confirmation){
	if(audio_is_playing(snd_low_oxygen_choking_d)){
		audio_stop_sound(snd_low_oxygen_choking_d);
	}
}

if(!underwater){
	if(audio_is_playing(snd_scrap_metal_dismantling_loop)){
		audio_stop_sound(snd_scrap_metal_dismantling_loop);
	}
}