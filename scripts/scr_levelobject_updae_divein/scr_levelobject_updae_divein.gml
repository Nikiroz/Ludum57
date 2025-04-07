function scr_levelobject_updae_dive_splashes() {
	if (bbox_bottom > mcr_waterline) {
		if (!dive_in) {
			instance_create_depth(x, y, depth - 1, o_water_divein)
			if(!audio_is_playing(snd_surfacing)){
				audio_play_sound(snd_surfacing, 1, false, global.soundVolume)
			}
		}
		else {
			if (bbox_top < mcr_waterline) {
				instance_single_get(x, y, depth - 1, o_water_diveout)
			}
		}
	
		dive_in = true;
	}
	else dive_in = false;
}