event_inherited();



boatControl = false;

if(!audio_is_playing(snd_boat_enginge_loop)){
	audio_play_sound(snd_boat_enginge_loop, 1, true, global.soundVoulme, 0, 1);	
}
	
scr_interactible_set_text();

event_user(1);