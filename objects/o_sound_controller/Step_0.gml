audio_emitter_gain(global.soundEmitter, global.soundVolume);
audio_emitter_gain(global.musicEmitter, global.musicVolume);
global.soundVolume = clamp(global.soundVolume, 0, 1);
global.musicVolume = clamp(global.musicVolume, 0, 1);

if(global.isMainMenu){
	exit;	
}

event_user(0);
event_user(1);
event_user(2);
event_user(3);
	