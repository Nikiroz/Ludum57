draw_set_font(fnt_main);
shader_set(shd_white_noise);
shader_set_uniform_f(shader_get_uniform(shd_white_noise, "time"), current_time * 0.001);
shader_set_uniform_f(shader_get_uniform(shd_white_noise, "itensity"), 0.5);
var _scale = global.isLudumBuild ? 0.675 : 0.5;
draw_sprite_ext(global.screenshot_sprite, 0, 0, 0, _scale, _scale, 0, c_white, 1);
shader_reset();
