if(soundLoop = -1){
	exit;	
}

audio_emitter_gain(emitter, global.soundVolume);
audio_emitter_position(emitter, x, y, 0);