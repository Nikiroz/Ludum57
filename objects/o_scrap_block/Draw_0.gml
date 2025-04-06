if (is_boated) exit;

draw_sprite_outline(scr_interactible_check_selected(id) ? outline_full : 0,
	sprite_index, image_index, x , y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)