if(fade > 0){

	shader_set(shd_white_noise);

	shader_set_uniform_f(shader_get_uniform(shd_white_noise, "time"), current_time * 0.001);
	shader_set_uniform_f(shader_get_uniform(shd_white_noise, "itensity"), fade);

	draw_surface_stretched(
		o_game_controller._surface,
		0,
		0,
		gameWidth,
		gameHeight
	);

	shader_reset();	

}