
shader_set(shd_white_noise);
shader_set_uniform_f(shader_get_uniform(shd_white_noise, "time"), current_time * 0.001);
shader_set_uniform_f(shader_get_uniform(shd_white_noise, "itensity"), popup);
draw_surface_stretched(
	o_game_controller._surface,
	0,
	0,
	gameWidth,
	gameHeight
);

shader_reset();

draw_text(gameWidth/2 - 100, 150, "You are dead");