/// @description Insert description here
// You can write your code in this editor
show_debug_message("stopsound")

if(!audio_is_playing(snd_boat_start) && boatControl){
	if(!audio_is_playing(snd_boat_enginge_loop)){
		audio_play_sound(snd_boat_enginge_loop, 1, true, global.soundVoulme);	
		audio_sound_pitch(snd_boat_enginge_loop, 1);
		o_boatController.isMoving = true;
	}
}