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

draw_text(300, 20, "Day " + string(global.dayNumbers));
draw_text(50, 120, "Scrap collected value: +" + string(global.scavenge) + "$");

draw_text(50, 160, "Food: -" + string(4) + "$");
draw_text(50, 180, "Oxygen: " + string(global.oxygen) + "$");
draw_text(50, 220, "Fuel: " + string(global.fuel) + "$");

draw_text(10, 280, "___________________________________");

draw_text(150, 320, "Income: " + string(income) + "$");
draw_text(270, 320, "Total Money: " + string(global.money) + "$");

draw_set_alpha(1);
