audio_falloff_set_model(audio_falloff_exponent_distance);

randomize();
musicAmbient = global.musicGameplayArray[irandom(array_length(global.musicGameplayArray) - 1)];
audio_play_sound_on(global.musicEmitter, snd_mus_scavenger_deep_danger, true, 2, 0);
audio_play_sound_on(global.musicEmitter, musicAmbient, false, 1);
underwater = false
