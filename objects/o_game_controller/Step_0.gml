var _cx = camera_get_view_x(view_camera[0]);
var _xspd = 5 * (keyboard_check(ord(leftKey)) - keyboard_check(ord(rightKey)));
_cx += _xspd

var _b = ds_map_find_first(background_map);

repeat(ds_map_size(background_map)){
	var _x = background_map[? _b] * _cx;
	show_debug_message(_x);
	
	layer_x(_b, _x);
	
	_b = ds_map_find_next(background_map, _b);
}