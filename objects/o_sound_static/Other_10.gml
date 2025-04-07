/// @description restart

if(!audio_is_playing(soundLoop)){
	audio_sound_gain(soundLoop, gain, 0);
	audio_play_sound_at(soundLoop, x + offsetX, y + offsetY, 0, ref_amount, max_amount, factor_amount, true, 1);
}