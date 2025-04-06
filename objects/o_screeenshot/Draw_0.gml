shader_set(shd_white_noise);
shader_set_uniform_f(shader_get_uniform(shd_white_noise, "time"), current_time * 0.001);
draw_sprite_ext(global.screenshot_sprite, 0, 0, 0, 1 / gameZoom, 1 / gameZoom, 0, c_white, 1);
shader_reset();