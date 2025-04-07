/// @desc Init

scale_x = choose(-1, 1)
dir_x = scale_x

sprite_index = choose(s_bg_fish01, s_bg_fish02)

var _w = camera_get_view_width(view_camera[0]);
x = camera_get_view_x(view_camera[0]) + _w * 0.5 - scale_x * _w * 0.5
var _y = camera_get_view_y(view_camera[0]),
	_h = camera_get_view_height(view_camera[0]),
	_y2 = _y + _h;
_y = max(_y, mcr_waterline + 64)
y = random_range(_y, _y2)

hspeed = dir_x * random_range(0.5, 2)
// vspeed = choose(0, 0, random(1) * choose(-1, 1))

scale = 0.33
image_xscale = scale_x * scale
image_yscale = scale

// time = camera_get_view_width(view_camera[0]) / abs(hspeed) + 2