audio_falloff_set_model(audio_falloff_exponent_distance);
musicAmbient = -1;
event_user(0);
audio_emitter_gain(global.soundEmitter, global.soundVolume);
audio_emitter_gain(global.musicEmitter, global.musicVolume);
global.soundVolume = clamp(global.soundVolume, 0, 1);
global.musicVolume = clamp(global.musicVolume, 0, 1);
underwater = false
