if (isMoving) {
	hsp = boatSpeed;

}

if (abs(hsp) > 0){ 
	
	self.move_boat(hsp);
	
	if(audio_is_playing(snd_boat_enginge_loop)){
		audio_sound_gain(snd_boat_enginge_loop, global.soundVoulme + abs(hsp),0);
		
		audio_sound_pitch(snd_boat_enginge_loop, 1.0 + abs(hsp)/3);
		show_debug_message(string(audio_sound_get_pitch(snd_boat_enginge_loop)));
		
	}
	
	show_debug_message(string(abs(hsp)/2));

}