function scr_levelobject_update_dive_splashes() {
	if (bbox_bottom > mcr_waterline) {
		if (!dive_in) {
			instance_create_depth(
				bbox_center_x, y, depth - 1, o_water_divein)
			
			if (!audio_is_playing(snd_surfacing)){
				audio_play_sound_on(global.soundEmitter, snd_surfacing, false, 1);
			}
		}
		else {
			if (bbox_top < mcr_waterline) {
				instance_single_get(
					bbox_center_x, y, depth - 1, o_water_diveout)
			}
		}
	
		dive_in = true;
	}
	else dive_in = false;
}