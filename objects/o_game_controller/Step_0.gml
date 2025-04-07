#region Pause handling
global.soundVolume = soundVolume;
if (global.isPause) exit;

#endregion

#region Parallax

var _cx = camera_get_view_x(view_camera[0]);
var _xspd = 5 * (keyboard_check(ord(leftKey)) - keyboard_check(ord(rightKey)));
_cx += _xspd

var _b = ds_map_find_first(background_map);

repeat(ds_map_size(background_map)){
	if(layer_get_name(_b) == "l_bg_clouds01" || layer_get_name(_b) == "l_bg_clouds02" || layer_get_name(_b) == "l_bg_stars"){
		layer_x(_b, camera_get_view_x(view_camera[0]));
	} else {
		layer_x(_b, background_map[? _b] * _cx);
	}
	_b = ds_map_find_next(background_map, _b);
}

#endregion

var _skyPhase = 2 * cos(hour / 4);
	
var lay_id  = layer_get_id("l_bg_stars");
var back_id = layer_background_get_id(lay_id);
layer_background_alpha(back_id, _skyPhase)// _skyPhase); //багует бленд луны и солнца

with (o_lights) {
	image_alpha = _skyPhase;
}

#region Time

time += timeScale;//gameSpeed / 1000
hour = time mod 24;

#endregion

#region Weather

var _fog_max_y = mcr_waterline - 100;
if (irandom(100) < 1 && camera_get_view_y(view_camera[0]) <= _fog_max_y) {
	var _x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + irandom(100),
		_y = camera_get_view_y(view_camera[0]) + irandom(camera_get_view_height(view_camera[0]) / 2);
	
	_y = min(_y, _fog_max_y)
	instance_create_layer(
		_x, _y,
		"Instances",
		choose(o_fog01, o_fog02)
	);
}

#endregion

#region Underwater

if (layer_exists("Bottom")) {
	part_system_depth(ps_bubbles, layer_get_depth("Bottom") + 1)
}

if (random(100) < 50) {
	var _bx1 = camera_get_view_x(view_camera[0]),
		_bx2 = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),
		_by1 = camera_get_view_y(view_camera[0]),
		_by2 = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);
	
	_by1 = max(mcr_waterline, _by1)
	if (_by1 < _by2) {
		part_particles_create(
			ps_bubbles,
			random_range(_bx1, _bx2),
			random_range(_by1, _by2),
			pt_bubbles_array[irandom(pt_bubbles_count - 1)],
			1
		)
	}
}

#endregion