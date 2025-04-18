/// @description Новая игра

with(o_sound){
	event_user(2);	
}
	
if(audio_is_playing(snd_mus_scavenger_deep_main_menu)){
	audio_stop_sound(snd_mus_scavenger_deep_main_menu);
}