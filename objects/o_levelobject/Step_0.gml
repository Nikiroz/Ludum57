//x += hsp;
//y += vsp;

var _gravity_factor = 1;

submerged = (bbox_center_y > mcr_waterline);

if (submerged) {
	vsp *= 0.85;
}

var _gravity_max = mcr_terminalVelocity * _gravity_factor;

if (vsp < _gravity_max) {
	vsp += mcr_gravity * _gravity_factor;
	
	if (vsp > _gravity_max) {
		vsp = _gravity_max;
	}
}

var _collide = move_and_collide(hsp, vsp, o_collision, 4),
	_collide_count = array_length(_collide);

print("MOVE:", hsp, vsp, _collide_count)

if (_collide_count) {
	var _cx = bbox_center_x,
		_cy = bbox_center_y
	
	for(var i = 0; i < _collide_count; i ++) {
		var _inst = _collide[i],
			_nx = (hsp ? bbox_right : bbox_left) + hsp,
			_ny = (vsp ? bbox_bottom : bbox_top) + vsp,
			_stepped_up = false
		
		if (hsp != 0 && place_meeting(_nx, bbox_bottom, _inst)) {
			var _step_size = 5, _offset = 0
			
			for(var i = 0; i <= _step_size; i ++) {
				if (!position_meeting(_nx, bbox_bottom - i, _inst)) break
				
				_offset ++
				
				_ny --
				y --
			}
			
			if (i >= _step_size) {
				_ny += _offset
				y += _offset
			}
			else _stepped_up = true
		}
		
		if (!_stepped_up) {
			while (hsp != 0 && place_meeting(_nx, y, _inst)) {
				hsp = approach(hsp, 0, 1);
			}
		}
		
		while (vsp != 0 && place_meeting(x, _ny, _inst)) {
			vsp = approach(vsp, 0, 1);
		}
		
		if (hsp == 0 && vsp == 0)
			break
	}
}

hsp *= 0.33;

//if (abs(hsp) < 0.05) hsp = 0;
