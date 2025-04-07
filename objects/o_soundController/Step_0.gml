if(!global.isPause){
	
	audio_listener_position(o_player.x, o_player.y, 0);
	audio_listener_orientation(0,1,0,0,0,1);
	
	with(o_sound_static){
		if(soundLoop != -1){
			if(audio_is_playing(soundLoop)){
				audio_sound_gain(soundLoop, gain, 0);
			}
		}
	}
	
}