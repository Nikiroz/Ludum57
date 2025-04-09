if (isMoving) {
	hsp = boatSpeed;
}

if (abs(hsp) > 0){ 
	
	self.move_boat(hsp);
	
	if(audio_is_playing(snd_boat_enginge_loop)){
		audio_sound_pitch(snd_boat_enginge_loop, 1 + abs(hsp)/3);
	}
	
}

