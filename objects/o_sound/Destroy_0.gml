if(soundLoop = -1){
	exit;	
}

audio_emitter_free(emitter);
audio_stop_sound(soundLoop);