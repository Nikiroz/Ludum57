/// @description Музыка на старте


if(global.isMainMenu){
	audio_play_sound_on(global.musicEmitter, snd_mus_scavenger_deep_main_menu, true, 1);
	audio_sound_gain(snd_mus_scavenger_deep_main_menu,1,0);
} else {
	randomize();
	musicAmbient = global.musicGameplayArray[irandom(array_length(global.musicGameplayArray) - 1)];
	audio_play_sound_on(global.musicEmitter, musicAmbient, false, 1);
	audio_play_sound_on(global.musicEmitter, snd_mus_scavenger_deep_danger, true, 2, 0);
	
	with(o_ship_winch_basic){
		event_user(2);	
	}
	with(o_ship_cloth_sound){
		event_user(2);	
	}

}

