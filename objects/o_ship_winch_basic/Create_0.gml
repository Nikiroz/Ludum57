event_inherited();

soundLoop = snd_hoist_loop;
ref_amount = 20;
max_amount = 80;
factor_amount = 2;

audio_play_sound_at(soundLoop, x + offsetX, y + offsetY, 0, ref_amount, max_amount, factor_amount, true, 1);