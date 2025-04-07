if (!global.isDebug) exit

draw_set_font(fnt_debug_small)

draw_set_color(c_green)

with (o_collision) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
	
	if (sprite_exists(sprite_index)) {
		gpu_set_fog(1, c_green, 0, 0)
		
		draw_sprite_ext(sprite_index, 0, x, y,
			image_xscale, image_yscale, 0, c_white, 0.3)
		
		gpu_set_fog(0, 0, 0, 0)
	}
}

draw_set_color(c_aqua)

with (o_levelobject) {
	if (object_index == o_rope_end && instance_is(target, o_player)) continue
	
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
	
	draw_text(bbox_right + 4, bbox_top, $"x: {x}\ny: {y}\nhsp: {hsp}\nvsp: {vsp}{is_submerged ? "\nin water" : ""}{is_grounded ? "\non ground" : ""}{is_boated ? "\non boat" : ""}")
}

draw_set_color(c_white)

draw_reset_font()