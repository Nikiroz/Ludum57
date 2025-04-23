/// @desc Update

seg_max = scr_calculate_max_rope_length()

with (o_player) {
	if (!aquasuit_equipped) {
		with (other) {
			rope_tension(1)
		}
	}
}

var _seg_array = seg_array,
	_normal_push = normal_push,
	_tension_speed = tension_speed,
	_grav_update = grav_update;
for (var i = 0; i < seg_count; i ++) {
	with (_seg_array[i]) {
		if (!is_fixed) {
			if (_grav_update) {
				speed[1] += 0.2
			}
			
			if (i > 0) {
				var _seg_prev = _seg_array[i - 1],
					_cx = lerp(x, _seg_prev.x, 0.5),
					_cy = lerp(y, _seg_prev.y, 0.5),
					_collision = collision_line(x, y, _seg_prev.x, _seg_prev.y, o_collision, true, false);
				
				if (instance_exists(_collision) && _collision.object_index != o_collision_ship) {
					var _normal = collision_find_normal(_cx, _cy, 6, 6, _collision);
					
					if (!is_undefined(_normal)) {
						// speed[0] -= _normal[0] * _normal_push
						// speed[1] -= _normal[1] * _normal_push
						x -= _normal[0]
						y -= _normal[1]
						speed[0] = speed[0] * 0.2
						speed[1] = speed[1] * 0.2
					}
				}
			}
			
			if (_tension_speed != 0) {
				speed[0] *= 0.8
				speed[1] *= 0.8
			}
			
			x += speed[0]
			y += speed[1]
		}
	}
}

repeat (1) for (var i = 0; i < seg_count - 1; i ++) {
	var _seg1 = _seg_array[i],
		_seg2 = _seg_array[i + 1],
		
		_delta_x = _seg2.x - _seg1.x,
		_delta_y = _seg2.y - _seg1.y,
		
		_delta_len = point_distance(0, 0, _delta_x, _delta_y),
		_stretch = max(_delta_len - seg_len, 0),
		_delta_nx = _delta_x,
		_delta_ny = _delta_y;
	
	if (_delta_len > 0) {
		_delta_nx /= _delta_len
		_delta_ny /= _delta_len
	}
	
	var _force_x = _delta_nx * _stretch * stiffness,
		_force_y = _delta_ny * _stretch * stiffness;
	
	if (!_seg1.is_fixed) {
		_seg1.x += _force_x
		_seg1.y += _force_y
		_seg1.speed[0] += _force_x
		_seg1.speed[1] += _force_y
	}
	
	if (!_seg2.is_fixed) {
		_seg2.x -= _force_x
		_seg2.y -= _force_y
		_seg2.speed[0] -= _force_x
		_seg2.speed[1] -= _force_y
	}
	
	var _damp_x = (_seg2.speed[0] - _seg1.speed[0]) * damping,
		_damp_y = (_seg2.speed[1] - _seg1.speed[1]) * damping;
	_seg1.speed[0] += _damp_x
	_seg1.speed[1] += _damp_y
	_seg2.speed[0] -= _damp_x
	_seg2.speed[1] -= _damp_y
}


if (seg_count > 1) {
	var _seg_first = seg_array[0],
		_seg_last = seg_array[seg_count - 1],
		
		_distance = point_distance(_seg_first.x, _seg_first.y, _seg_last.x, _seg_last.y),
		_max_len = rope_length_get(true);
	
	// /*
	var _delta = max(0, _distance * 0.8 - _max_len);
	if (_delta > seg_len) {
		rope_seg_add()
		with (o_ship_winch_basic) {
			motion += 0.9;
		}
	}
	// */
}