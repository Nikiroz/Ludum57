/// @description start
show_debug_message("start sound:" + string(soundLoop))
audio_play_sound_at(soundLoop, x + offsetX, y + offsetY, 0, ref_amount, max_amount, factor_amount, true, 1);
