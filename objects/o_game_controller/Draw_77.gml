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
		draw_sprite_ext(sprite_index, image_index, (x - camera_get_view_x(view_camera[0])) * 2 + _angle * 5, (y - camera_get_view_y(view_camera[0]) * 2) * 2 + 36 - _angle * 11, image_xscale, image_yscale, _angle, image_blend, image_alpha)
	}
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
	draw_surface(_surface, 0, 0);
	gpu_set_blendmode(bm_normal);

} 