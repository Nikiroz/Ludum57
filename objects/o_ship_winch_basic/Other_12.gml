/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(audio_is_playing(soundLoop)){
	audio_sound_gain(soundLoop,0,0);	
}