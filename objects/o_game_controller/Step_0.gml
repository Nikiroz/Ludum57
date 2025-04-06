#region Pause handling

if (keyboard_check_pressed(vk_f1)) {
	global.isPause = !global.isPause;
	
	if (global.isPause) {
		instance_deactivate_all(true)
		instance_activate_object(o_menu)
	}
	else {
		instance_activate_all()
	}
	
	event_user(0);
}

if (global.isPause) exit;

#endregion

#region Paralax

var _cx = camera_get_view_x(view_camera[0]);
var _xspd = 5 * (keyboard_check(ord(leftKey)) - keyboard_check(ord(rightKey)));
_cx += _xspd

var _b = ds_map_find_first(background_map);

repeat(ds_map_size(background_map)){
	if(layer_get_name(_b) == "l_bg_clouds01" || layer_get_name(_b) == "l_bg_clouds02" || layer_get_name(_b) == "l_bg_stars"){
		layer_x(_b,  camera_get_view_x(view_camera[0]));
	} else {
		layer_x(_b, background_map[? _b] * _cx);
	}
	_b = ds_map_find_next(background_map, _b);
}

#endregion


var _skyPhase = 2 * cos(hour / 4);
	
var lay_id = layer_get_id("l_bg_stars");
var back_id = layer_background_get_id(lay_id);
layer_background_alpha(back_id, _skyPhase);


	



#region Time

time += timeScale;//gameSpeed / 1000
hour = time mod 24;

#endregion
