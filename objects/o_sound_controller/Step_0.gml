audio_emitter_gain(global.soundEmitter, global.soundVolume);
audio_emitter_gain(global.musicEmitter, global.musicVolume);

if(isStepPlay(global.musicGameplayArray)){
	audio_play_sound_on(global.musicEmitter, getRandomSound(global.musicGameplayArray), false, 1, 1);
}

if(instance_exists(o_player)){
	
	audio_listener_position(o_player.x, o_player.y, 0);
	audio_emitter_position(global.musicEmitter, o_player.x, o_player.y, 0);
	audio_emitter_position(global.soundEmitter, o_player.x, o_player.y, 0);
	
	underwater = (o_player.y > mcr_waterline);
	
	if(!o_player.is_dead && o_player.oxygen < (o_player.oxygen_capacity * 0.15)){
		
		if(!audio_is_playing(snd_low_oxygen_choking_d)){
			audio_play_sound_on(global.soundEmitter, snd_low_oxygen_choking_d, true, 1);
		}
		
	}
	
	if(o_player.climb_aboard_confirmation){
		if(audio_is_playing(snd_low_oxygen_choking_d)){
			audio_stop_sound(snd_low_oxygen_choking_d);
		}
	}
	
}

//фикс вебверсии

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
	
		audio_play_sound_on(global.soundEmitter, snd_ambience_night, true, 1, 1);
		audio_sound_gain(snd_ambience_night, 0, 0);
		audio_sound_gain(snd_ambience_night, 1, 3000);
		
	}
	
	if(audio_is_playing(snd_ambience_night)){
		if(underwater){
			audio_sound_gain(snd_ambience_night, 0, 0);
		} else {
			audio_sound_gain(snd_ambience_night, 1, 0);
		}
	}
	
}

if(instance_exists(o_father)){
	
	if(!o_father.boatControl){
	
		if(isStepPlay(global.soundBoatArray)){
			if(!underwater){
				audio_play_sound_on(global.soundEmitter, getRandomSound(global.soundBoatArray), false, 100);
				alarm[0] = irandom(30);
			} else {
				alarm[0] = -1;
			}
		}
	} else {
		
		if(!audio_is_playing(snd_boat_stop) && o_father.startEngine){
			if(!audio_is_playing(snd_boat_enginge_loop)){
				audio_play_sound_on(global.soundEmitter, snd_boat_enginge_loop, true, 1);
			} 
		}
		
	}
}

if(audio_is_playing(snd_low_oxygen_choking_d) && !underwater){
	audio_stop_sound(snd_low_oxygen_choking_d);
}

if(!underwater){
	if(audio_is_playing(snd_scrap_metal_dismantling_loop)){
		audio_stop_sound(snd_scrap_metal_dismantling_loop);
	}
}
