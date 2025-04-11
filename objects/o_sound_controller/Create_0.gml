audio_falloff_set_model(audio_falloff_exponent_distance);

randomize();
musicAmbient = global.musicGameplayArray[irandom(array_length(global.musicGameplayArray) - 1)];
audio_play_sound_on(global.musicEmitter, musicAmbient, false, 1);
underwater = false
