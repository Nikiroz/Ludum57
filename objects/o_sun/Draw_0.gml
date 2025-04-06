
gpu_set_blendmode(bm_add);
sprite_index = s_sun_mask;
image_alpha = 0.6;
image_blend = make_colour_rgb(245,246,199);
draw_self();
image_alpha = 1;
sprite_index = s_sun;
draw_self();
gpu_set_blendmode(bm_normal)
