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

draw_set_alpha(fade);
draw_sprite(s_Dead_sign, 0, gameWidth/2, (gameHeight/2));
draw_set_alpha(1);
