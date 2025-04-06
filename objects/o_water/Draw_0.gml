if (global.isDebug) exit;

shader_set(shd_water);
var u_time = shader_get_uniform(shd_water, "time");
shader_set_uniform_f(u_time, time / 60);

// Нарисуй спрайт или что угодно, что будет "волноваться"
draw_sprite(sprite_index, 0, x, y);


shader_reset();