surface_set_target(_surface);

shader_set(shd_day_night)
	
var _minShading = 0.4;
	
var _shadingTime = (max(hour - 6, _minShading));
if (hour > 14)
	_shadingTime = (max(18 - hour, _minShading));
else if (hour < 5)
	_shadingTime = _minShading
	
shader_set_uniform_f(shader_get_uniform(shd_day_night, "time"), _shadingTime * 4);
	
gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
draw_surface(application_surface, 0, 0);
shader_reset();

gpu_set_blendmode(bm_add);
with (o_lights) {
	draw_sprite_ext(sprite_index, image_index, (x - camera_get_view_x(view_camera[0])) * 2, (y - camera_get_view_y(view_camera[0]) * 2) * 2 + 30, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
}
gpu_set_blendmode(bm_normal);
surface_reset_target();

draw_surface(_surface, 0, 0);