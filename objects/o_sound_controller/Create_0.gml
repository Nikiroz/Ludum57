audio_falloff_set_model(audio_falloff_exponent_distance);

randomize();
audio_play_sound_on(global.musicEmitter, global.musicGameplayArray[irandom(array_length(global.musicGameplayArray) - 1)], false, 1);
underwater = false
