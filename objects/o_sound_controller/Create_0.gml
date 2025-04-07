audio_falloff_set_model(audio_falloff_exponent_distance);
audio_play_sound(snd_ambience_waves, 1, true, global.soundVolume);
audio_play_sound(snd_underwater_loop, 1, true, global.soundVolume);
randomize();
currentMusic = audio_play_sound(global.soundGameplayArray[irandom(array_length(global.soundGameplayArray) - 1)], 100, false, global.musicVolume);
underwater = false
