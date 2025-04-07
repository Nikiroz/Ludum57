if(!global.isPause){
	
	audio_listener_position(o_player.x, o_player.y, 0);
	audio_listener_orientation(0,1,0,0,0,1);
	
	with(o_sound){
		if(soundLoop != noone){
			if(!audio_is_playing(soundLoop)){
				audio_sound_gain(soundLoop, 1000, 0);
				audio_play_sound_at(soundLoop, x + offsetX, y + offsetY, 0, ref_amount, max_amount, factor_amount, true, 1);
			}
		}
	}
	
}