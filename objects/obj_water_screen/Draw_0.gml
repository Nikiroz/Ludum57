/// @desc Draw

// anim += 0.01

waterline_y = mcr_waterline - 12

var _vx = camera_get_view_x(view_camera[0]) - 1,
	_vy = camera_get_view_y(view_camera[0]) - 1,
	_vx2 = _vx + camera_get_view_width(view_camera[0]) + 2,
	_vy2 = _vy + camera_get_view_height(view_camera[0]) + 2;

gpu_push_state()
gpu_set_tex_repeat(true)

shader_set(shd_water_screen)

var _height = sprite_get_height(sprite);
_vy = max(
	waterline_y - (_vy * 0.5 - offset_y * 2) * parallax_y,
	waterline_y
)
// _vy2 = _vy + _height

shader_set_uniform_f_array(
	u_sprite_size,
	[
		sprite_get_width(sprite),
		sprite_get_height(sprite)
	]
)
shader_set_uniform_f_array(
	u_sprite_pos,
	[
		_vx,
		_vy
	]
)

draw_sprite_pos(
	sprite, 0,
	_vx, _vy,
	_vx2, _vy,
	_vx2, _vy2,
	_vx, _vy2,
	1
)

shader_reset()

// shader_reset()
/*
texture_set_stage(
	u_texture,
	sprite_get_texture(sprite, 0)
)
var _water_line = o_game_controller.waterlineY - 16;
shader_set_uniform_f_array(
	u_base_y,
	[_water_line + base_y, is_wave, _water_line]
)
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
shader_set_uniform_f(
	u_anim,
	anim
)

draw_sprite_pos(
	spr_white_pixel, 0,
	_vx, _vy,
	_vx2, _vy,
	_vx2, _vy2,
	_vx, _vy2,
	1
)
*/

gpu_pop_state()