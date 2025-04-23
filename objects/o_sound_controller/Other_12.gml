/// @description Игрок

if(instance_exists(o_player)){
	
	underwater = (o_player.y > mcr_waterline);
	
	if(o_player.is_boated && o_player.walking){
		if(isStepPlay(global.soundStepArray)){
			audio_play_sound_on(global.soundEmitter, getRandomSound(global.soundStepArray), false, 100);
		}	
	}
	
	if(!o_father.isEndDay){
		audio_listener_position(o_player.x, o_player.y, 0);
		audio_emitter_position(global.musicEmitter, o_player.x, o_player.y, 0);
		audio_emitter_position(global.soundEmitter, o_player.x, o_player.y, 0);
	} else{
		audio_listener_position(o_camera.cameraX + gameWidth/2, o_camera.cameraY+ gameHeight/2, 0);
		audio_emitter_position(global.musicEmitter, o_camera.cameraX + gameWidth/2, o_camera.cameraY + gameHeight/2, 0);
		audio_emitter_position(global.soundEmitter, o_camera.cameraX + gameWidth/2, o_camera.cameraY + gameHeight/2, 0);
	}
	
	
	if(o_player.oxygen < (o_player.oxygen_capacity * 0.05)){
		
		if(underwater){
			if(!audio_is_playing(snd_low_oxygen_choking_d)){
				audio_play_sound_on(global.soundEmitter, snd_low_oxygen_choking_d, true, 1);
			}
		} else {
			if(audio_is_playing(snd_low_oxygen_choking_d)){
				audio_stop_sound(snd_low_oxygen_choking_d);
			}	
		}
		
	}
				
	if(o_player.is_dead){
			
		if(audio_is_playing(snd_mus_scavenger_deep_danger)){
			audio_stop_sound(snd_mus_scavenger_deep_danger);
		}
		
		if(audio_is_playing(musicAmbient)){
			audio_stop_sound(musicAmbient);
		}
		
		if(audio_is_playing(snd_low_oxygen_choking_d)){
			audio_stop_sound(snd_low_oxygen_choking_d);
		}
		
	}
	
	if(!underwater){
		if(audio_is_playing(snd_scrap_metal_dismantling_loop)){
			audio_stop_sound(snd_scrap_metal_dismantling_loop);
		}
	}
	
}