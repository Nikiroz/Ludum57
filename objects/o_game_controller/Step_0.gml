#region Paralax

var _cx = camera_get_view_x(view_camera[0]);
var _xspd = 5 * (keyboard_check(ord(leftKey)) - keyboard_check(ord(rightKey)));
_cx += _xspd

var _b = ds_map_find_first(background_map);

repeat(ds_map_size(background_map)){
	layer_x(_b, background_map[? _b] * _cx);
	_b = ds_map_find_next(background_map, _b);
}

#endregion
#region Time

if(hour < 24){
	if(second >= 60){
		minute++;
		second = second - 60;
	}
	if(minute >= 60){
		hour++;
		minute = minute - 60;
	}
} else {
	alarm[0] = -1;
	second = 0;
	minute = 0;
	hour   = 0;
}

#endregion