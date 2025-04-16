global.rope_upgrade = true;
global.money = 0;
global.dayNumbers = 1;
global.restartTime  = false;
global.screenshot_sprite = -1;
global.nonLootableObects = array_create(0);

if(!variable_global_exists("soundVolume")){
	
	global.musicEmitter = audio_emitter_create();
	global.soundEmitter = audio_emitter_create();
	global.soundVolume = 0.8;
	global.musicVolume = 0.10;
	
	audio_emitter_gain(global.soundEmitter, global.soundVolume);
	audio_emitter_gain(global.musicEmitter, global.musicVolume);
}

show_debug_message("INIT")
room_goto(r_Game)