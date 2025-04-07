/// @desc Draw

var _x1 = camera_get_view_x(view_camera[0]),
	_y1 = max(camera_get_view_y(view_camera[0]), mcr_waterline),
	_x2 = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),
	_y2 = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);

if (_y1 >= _y2) {
	exit
}

shader_set(shd_underwater_dark)

shader_set_uniform_f_array(u_gradient, [mcr_waterline, room_height / 4])
shader_set_uniform_f_array(u_playerpos, [o_player.x, o_player.y - 24])
shader_set_uniform_f(u_radius, 256)
shader_set_uniform_f_array(u_color, [22, 27, 24])

draw_sprite_pos(
	spr_white_pixel, 0,
	_x1, _y1,
	_x2, _y1,
	_x2, _y2,
	_x1, _y2,
	1
)

shader_reset()