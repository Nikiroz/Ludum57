//shader_set(shd_day_night);
//shader_set_uniform_f(shader_get_uniform(shd_day_night, "time"), time);

gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha)
draw_surface(application_surface, 0, 0);

//gpu_set_blendmode(bm_add);
//draw_set_color(c_black);
//draw_rectangle(0, 0, surface_get_width(application_surface), surface_get_height(application_surface)), false;
gpu_set_blendmode(bm_normal);

//shader_reset();