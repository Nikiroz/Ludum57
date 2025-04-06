shader_set(shd_day_night);
shader_set_uniform_f(shader_get_uniform(shd_day_night, "time"), current_time / 1000.0);
draw_surface(application_surface, 0 , 0);
shader_reset();

