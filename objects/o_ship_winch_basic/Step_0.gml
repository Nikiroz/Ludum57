/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
var soundLevel = clamp(motion - 0.9, 0, 1);
if(audio_is_playing(soundLoop)){
	audio_sound_gain(soundLoop,soundLevel,0);	
}
