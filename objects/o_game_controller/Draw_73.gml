if (!global.isDebug) exit

draw_set_color(c_green)

with (o_collision) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
	
	if (sprite_exists(sprite_index)) {
		gpu_set_fog(1, c_green, 0, 0)
		
		draw_sprite_ext(sprite_index, 0, x, y,
			image_xscale, image_yscale, 0, c_white, 0.8)
		
		gpu_set_fog(0, 0, 0, 0)
	}
}

draw_set_color(c_blue)

with (o_levelobject) {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
	
	draw_text(bbox_right, bbox_top, $"x: {x}\ny: {y}\n{submerged ? "in water" : ""}")
}

draw_set_color(c_white)
