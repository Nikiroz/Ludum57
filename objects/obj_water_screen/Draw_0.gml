/// @desc Draw

var _vx = camera_get_view_x(view_camera[0]) - 1,
	_vy = camera_get_view_y(view_camera[0]) - 1,
	_vx2 = _vx + camera_get_view_width(view_camera[0]) + 2,
	_vy2 = _vy + camera_get_view_height(view_camera[0]) + 2;

gpu_push_state()
gpu_set_tex_repeat(true)

shader_set(shd_water_screen)
texture_set_stage(
	u_texture,
	sprite_get_texture(sprite, 0)
)
shader_set_uniform_f(u_base_y, base_y)
shader_set_uniform_f_array(
	u_sprite_size,
	[
		sprite_get_width(sprite),
		sprite_get_height(sprite)
	]
)
shader_set_uniform_f_array(
	u_view,
	[_vx, _vy]
)
shader_set_uniform_f_array(
	u_parallax,
	[parallax_x, parallax_y]
)

draw_sprite_pos(
	spr_white_pixel, 0,
	_vx, _vy,
	_vx2, _vy,
	_vx2, _vy2,
	_vx, _vy2,
	1
)

shader_reset()

gpu_pop_state()