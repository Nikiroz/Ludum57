#macro mcr_ropeRenderThickness 1
#macro mcr_ropeRenderColor #1c1c1b

function scr_render_ropes() {
	if (false && global.isDebug) {
		draw_set_font(fnt_debug_small);
		
		with (o_rope_simple) {
			if (instance_exists(parent)) {
				draw_set_color(c_blue);
				draw_text(x, y, stress);
			
				draw_set_color(c_white);
				draw_line_width(x, y, parent.x, parent.y, mcr_ropeRenderThickness);
			}
		}
		
		exit
	}
	
	//
	draw_set_color(mcr_ropeRenderColor);
	
	with (o_rope_simple) {
		if (instance_exists(parent)) {
			draw_line_width(x, y, parent.x, parent.y, mcr_ropeRenderThickness);
		}
	}
	
	draw_set_color(c_white);
}

function scr_rope_pull(_speed, _direction) {
	if (instance_is(parent, o_rope_simple) && _speed > 0.1) {
		var _px = lerp(x, parent.x, 0.5),
			_py = lerp(y, parent.y, 0.5);
		
		_direction = angle_lerp(_direction, point_direction(
			_px, _py, parent.x, parent.y), 0.5)
		
		with (parent) scr_rope_pull(_speed * 0.75, _direction);
	}
	
	hsp += ldrx(_speed, _direction);
	vsp += ldry(_speed, _direction);
}

function scr_rope_pull_OBSOLETE(_hsp, _vsp, _iteration = 0) {
	print("pre speed", speed_get(), _hsp, _vsp)
	
	hsp += _hsp
	vsp += _vsp
	
	var _limit = length,
		_speed = speed_get()
	
	print(_iteration, _speed)
	
	if (_speed > _limit) {
		var _excess = _speed - _limit
		
		print(_iteration, _excess)
		
		if (instance_exists(parent) && parent.object_index == o_rope_simple) {
			var _direction = point_direction(0, 0, hsp, vsp)
			
			print(_iteration, ">", _excess, "|", ldrx(_excess, _direction), ldry(_excess, _direction))
			
			with (parent) return scr_rope_pull(
				ldrx(_excess, _direction), ldry(_excess, _direction), _iteration + 1)
		}
		
		return _excess
	}
	
	return 0
}


