if(global.isDebug){

	draw_set_color(c_lime);
	draw_circle(x + offsetX, y + offsetY, ref_amount, true);

	draw_set_color(c_red);
	draw_circle(x + offsetX, y + offsetY, max_amount, true);
	
	if(audio_is_playing(soundLoop)){
		draw_sprite(s_sound, 0, x, y-32);
	}
	
}
