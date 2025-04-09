audio_falloff_set_model(audio_falloff_exponent_distance);

randomize();
currentMusic = audio_play_sound(global.soundGameplayArray[irandom(array_length(global.soundGameplayArray) - 1)], 100, false, global.musicVolume);
underwater = false
