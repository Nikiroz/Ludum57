/// @description Интерфейс

if (is_dead) exit;

var _width = display_get_gui_width(),
	_height = display_get_gui_height();

if (climb_aboard_confirmation || confirmation_time > 0) {
	if (!climb_aboard_confirmation) {
		confirmation_time --;
	}
	else if (confirmation_time < 10) {
		confirmation_time ++;
	}
	
	var _t = 1 - (confirmation_time / 10),
		_xscale = 1 + _t * 0.1,
		_yscale = 1 - _t * 0.1,
		_confirmed = false,
		_options = [
			[ actionKey , "Continue diving" ],
			[ action2Key, "Climb aboard" ]
		],
		_option_count = array_length(_options),
		_xpos = round(_width * 0.5),
		_ypos = round(_height * 0.75);
	
	draw_set_halign(fa_center);
	draw_reset_font();
	
	if (_option_count == 0) exit;
	
	var _step = (_width * 0.5) / _option_count,
		_px = _xpos - _step
	
	for(var i = 0; i < _option_count; i ++) {
		var _option = _options[i], _key = _option[0],
			_str = $"[{_key}] {_option[1]}";
		
		if (climb_aboard_confirmation && keyboard_check_pressed(ord(_key))) {
			// continue diving
			if (i == 0) {
				vsp += 3;
			}
			// climb aboard
			else if (i == 1) {
				facing = facing_right;
				anim_aquasuit_ascend = 0;
				sprite_index = s_player_aquasuit_ascend;
				image_index = 0;
			}
			
			set_climb_confirmation_active(false);
		}
		
		var _string_width = string_width(_str);
		
		scr_text_hl(
			_px + _step * i, _ypos, _str,
			_xscale, _yscale, c_white, 1);
	}
	
	draw_set_halign(fa_left);
}


if (oxygen_meter_active) {
	var surf = surface_create(_width, _height);
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	smoothDepthMeter = lerp(smoothDepthMeter, depthmeterY, 0.05);
	
	draw_set_color(c_white);
	var _count = 15
	var _gap = 2;
	var _propotion = _height / _count;
	var _firstY;

	for (var i = 0; i < 100; ++i) {
	
		if(i == 0){	_firstY = - smoothDepthMeter; }
		var _lastY  = _firstY + _propotion;
		draw_rectangle(_width - 7, _gap + _firstY, _width - 6, _lastY, false);
		draw_set_font(fnt_number);
		draw_text(_width - 15, _gap + _firstY - 3, string(i - 9));	
		_firstY = _lastY;
		
	}

	var _progress = 1 - oxygen / oxygen_capacity;
	var	_thickness = 17;
	var _xpos = _width - _thickness * 0.5 - 29;
	var	_length = 70;
	var _y2 = _height - 10;
	var _y1 = _y2 - _length;

	if(global.isDebug){
		draw_text(10,10,string(_progress))
	}
	
	if(_progress < 0.95){	
		draw_set_color(make_color_rgb(118, 130, 142));
	}
	else{
		draw_set_color(make_color_rgb(138, 0, 0));
	}	

	draw_line_width(_xpos, _y1 + _length * _progress, _xpos, _y2, _thickness);

	gpu_set_blendmode(bm_subtract);
	
	draw_sprite(s_tank_mask, 0, _width - 25, _height + 8);
	
	draw_set_color(c_white);

	var _x = _width - 15;
	var _y = (_height / 2) - 5;

	draw_rectangle(_x + 7, _y, _x + 15, _y + 10, false);
	draw_rectangle(_x, 0, _x + 15, 10, false);
	draw_rectangle(_x, _height - 10, _x + 15, _height, false);
	gpu_set_blendmode(bm_normal);

	draw_sprite(s_arrow, 0, _width - 4, _height / 2);
	draw_sprite(s_tank, 0, _width - 25, _height + 8);
		
	draw_set_color(c_white);
	surface_reset_target();
	draw_surface(surf, 0, 0);
	surface_free(surf);
	draw_set_font(fnt_debug);
	
}