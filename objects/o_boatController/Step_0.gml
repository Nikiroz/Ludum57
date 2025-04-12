if (isMoving) {
	hsp = boatSpeed;
}

var startEngine = o_father.startEngine;

if(!startEngine && audio_is_playing(snd_boat_enginge_loop)){
	audio_sound_pitch(snd_boat_enginge_loop, 0);
	audio_stop_sound(snd_boat_enginge_loop);
}

if (abs(hsp) > 0){ 
	
	self.move_boat(hsp);
	
	if(audio_is_playing(snd_boat_enginge_loop) && startEngine){
		audio_sound_pitch(snd_boat_enginge_loop, 1 + abs(hsp)/4);
	}
	
}

