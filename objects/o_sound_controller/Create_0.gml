randomize();

audio_falloff_set_model(audio_falloff_exponent_distance);
event_user(5);

musicAmbient = -1;
musicFade	 = -1;

audio_emitter_gain(global.soundEmitter, global.soundVolume);
audio_emitter_gain(global.musicEmitter, global.musicVolume);
global.soundVolume = clamp(global.soundVolume, 0, 1);
global.musicVolume = clamp(global.musicVolume, 0, 1);
underwater = false

function getRandomSound(_array){
	var randomIndex = irandom(array_length(_array) - 1);
	return _array[randomIndex];
}

function isStepPlay(_array){
	var size = array_length(_array);
	var isPlay = !audio_is_playing(_array[0]);

	for (var i = 1; i < size; i++) {
		isPlay &= !audio_is_playing(_array[i]);
	}

	return isPlay;
}
