if(surface_exists(_surface)){
	surface_set_target(_surface);

	shader_set(shd_day_night)
	
	/*
	var _minShading = 0.4;
	
	var _shadingTime = (max(hour - 6, _minShading));
	if (hour > 14)
		_shadingTime = (max(18 - hour, _minShading));
	else if (hour < 5)
		_shadingTime = _minShading
	*/
	
	var viewArray= [camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0])];
	var viewposArray= [camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0])];
	var view_pos = shader_get_uniform(shd_day_night, "view_pos")
	var view_size = shader_get_uniform(shd_day_night, "view_size")
	
	shader_set_uniform_f(shader_get_uniform(shd_day_night, "hour"), hour);
	shader_set_uniform_f(shader_get_uniform(shd_day_night, "wave_y"), o_water_screen.wave_y);
	shader_set_uniform_f_array(view_size, viewArray);
	shader_set_uniform_f_array(view_pos, viewposArray);
	
	//gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
	draw_surface(application_surface, 0, 0);
	shader_reset();
	
	gpu_set_blendmode(bm_add);
	with (o_ship_light) {
		var _angle = o_boatController.boatAngle;
		draw_sprite_ext(sprite_index, image_index, (x - camera_get_view_x(view_camera[0])) * 2 + _angle * 5 + 5, (y - camera_get_view_y(view_camera[0]) * 2) + 217 - _angle * 11, image_xscale * 2, image_yscale * 2, _angle, image_blend, image_alpha)
	}
	with (o_moon) {
		if !(other.hour > 7.57 && other.hour <22.31) {
			draw_sprite_ext(s_moon_mask, 0, (x - camera_get_view_x(view_camera[0])) * 2, (y - camera_get_view_y(view_camera[0]) * 2) * 2 + 74, image_xscale * 2, image_yscale * 2, image_angle, image_blend, image_alpha)
			draw_sprite_ext(s_moon, 0, (x - camera_get_view_x(view_camera[0])) * 2, (y - camera_get_view_y(view_camera[0]) * 2) * 2 + 74, image_xscale * 2, image_yscale * 2, image_angle, image_blend, image_alpha)
		}
	}
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	var _app_data = application_get_position();
	gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
	draw_surface_stretched(
		_surface,
		_app_data[0],
		_app_data[1],
		_app_data[2] - _app_data[0],
		_app_data[3] - _app_data[1]
	);
	gpu_set_blendmode(bm_normal);

} 