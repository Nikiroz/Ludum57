/// @description Интерфейс

if (is_dead) exit;

var _width = display_get_gui_width(),
	_height = display_get_gui_height();

if (oxygen_meter_active) {
	var _progress = 1 - oxygen / oxygen_capacity,
		_thickness = 16, _xpos = _width - _thickness * 0.5 - 8,
		_length = 120, _y2 = _height - 8, _y1 = _y2 - _length;
	
	draw_set_color(c_navy);
	draw_line_width(_xpos, _y1, _xpos, _y2, _thickness);
	
	draw_set_color(c_aqua);
	draw_line_width(_xpos, _y1 + _length * _progress, _xpos, _y2, _thickness);
	
	draw_set_color(c_white);
}

scr_text(40, 40, $"{climb_aboard_confirmation} {confirmation_time}")

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
				
			}
			// climb aboard
			else if (i == 1) {
				
			}
			
			set_climb_aboard(false);
		}
		
		var _string_width = string_width(_str);
		
		scr_text_hl(
			_px + _step * i, _ypos, _str,
			_xscale, _yscale, c_white, 1);
	}
	
	draw_set_halign(fa_left);
}