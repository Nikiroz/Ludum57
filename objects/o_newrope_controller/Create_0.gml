/// @desc Init

seg_array = []
seg_len = ropeSegmentLength
seg_count = 0
seg_max = scr_calculate_max_rope_length()

stiffness = 0.5
damping = 0.005
tension_speed = 0

normal_push = 0.3

start_x = x
start_y = y



/// @func rope_seg_add()
rope_seg_add = function() {
	if (seg_count >= seg_max) exit
	
	var _x = start_x,
		_y = start_y + seg_len;
	
	var _seg = {
		x: _x,
		y: _y,
		speed: [0, 0],
		is_fixed: true
	};
	if (seg_count > 0) {
		seg_array[0].is_fixed = false
	}
	
	array_insert(seg_array, 0, _seg)
	seg_count = array_length(seg_array)
}

/// @func rope_seg_reduce()
rope_seg_reduce = function() {
	if (seg_count == 1) exit
	
	array_delete(seg_array, 0, 1)
	seg_array[0].is_fixed = true
	seg_count = array_length(seg_array)
}

/// @func rope_tension(_max_len_factor=1)
rope_tension = function(_max_len_factor = 1) {
	if (seg_count > 1) {
		var _seg_first = seg_array[0],
			_seg_last = seg_array[seg_count - 1],
			
			_distance = point_distance(_seg_first.x, _seg_first.y, _seg_last.x, _seg_last.y),
			_max_len = rope_length_get(true);
		
		var _delta = _max_len - _distance * _max_len_factor;
		while (_delta > seg_len) {
			rope_seg_reduce()
			_delta -= seg_len
			tension_speed = 1
		}
	}
}

/// @func rope_length_get(_is_max=true)
rope_length_get = function(_is_max = true) {
	if (_is_max) {
		return seg_count * seg_len
	}
	
	var _length = 0,
		_seg1,
		_seg2;
	
	for (var i = 0; i < seg_count - 1; i ++) {
		_seg1 = seg_array[i]
		_seg2 = seg_array[i + 1]
		
		_length += point_distance(_seg1.x, _seg1.y, _seg2.x, _seg2.y)
	}
	
	return _length
}

/// @func rope_tension_get([_factor=1])
rope_tension_get = function(_factor = 1) {
	var _rope_len = rope_length_get(false),
		_rope_max = rope_length_get(true);
		/*
		_distance = point_distance(
			seg_array[0].x, seg_array[0].y,
			seg_array[seg_count - 1].x, seg_array[seg_count - 1].y
		);
		*/
	
	return _rope_len > _rope_max * _factor
}