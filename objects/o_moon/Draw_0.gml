gpu_set_blendmode(bm_add);
draw_sprite_ext(s_moon_mask, 0, x, y, image_xscale, image_yscale, image_angle, make_colour_rgb(245,246,199), 0.6)
draw_sprite_ext(s_moon, 0, x, y, image_xscale, image_yscale, image_angle, make_colour_rgb(245,246,199), 1)
gpu_set_blendmode(bm_normal)
