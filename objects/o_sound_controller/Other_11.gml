/// @description Лодка

if(instance_exists(o_father)){
	
	if(!o_father.boatControl){
	
		if(isStepPlay(global.soundBoatArray)){
			if(!underwater){
				audio_play_sound_on(o_boatSound.emitter, getRandomSound(global.soundBoatArray), false, 100);
				alarm[0] = irandom(30);
			} else {
				alarm[0] = -1;
			}
		}
	} 
	
}
