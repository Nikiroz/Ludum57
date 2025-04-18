/// @description Возврат в главное меню
audio_stop_all();
if(!audio_is_playing(snd_mus_scavenger_deep_main_menu)){
	audio_play_sound_on(global.musicEmitter, snd_mus_scavenger_deep_main_menu, true, 1);
}