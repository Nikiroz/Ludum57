#macro mcr_ropeRenderThickness 1
#macro mcr_ropeRenderColor #2e2d27

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

function scr_rope_pull(_hsp, _vsp, _iteration = 0) {
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


