if(soundLoop = -1){
	exit;	
}

if(global.isDebug){

	draw_set_color(c_lime);
	draw_circle(audio_emitter_get_x(emitter) + offsetX, audio_emitter_get_y(emitter)  + offsetY, ref_amount, true);

	draw_set_color(c_red);
	draw_circle(audio_emitter_get_x(emitter) + offsetX, audio_emitter_get_y(emitter)  + offsetY, max_amount, true);
	
	if(audio_is_playing(soundLoop)){
		draw_sprite(s_sound, 0, x, y-32);
	}
	
}
