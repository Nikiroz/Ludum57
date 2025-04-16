/// @desc Update

with (target) {
	other.x = bbox_center_x
	other.y = bbox_center_y
}

var _x = x,
	_y = y;
with (o_newrope_controller) {
	var _seg = seg_array[seg_count - 1];
	_seg.x = _x
	_seg.y = _y
	_seg.is_fixed = true
}



with (target) {
	var _tx = x,
		_ty = bbox_bottom - 20,
		_is_player = (object_index == o_player);
	
	if (_is_player && instance_exists(o_newrope_source) && input_pull_up) {
		if (bbox_top > mcr_waterline) {
			/// rope_length_get
			/*
			var _rope_len = 0;
			var _dist_max = 0;
			with (o_newrope_controller) {
				rope_tension(0.5)
				_rope_len = rope_length_get(false)
				_dist_max = point_distance(
					seg_array[0].x, seg_array[0].y,
					seg_array[seg_count - 1].x, seg_array[seg_count - 1].y
				) * 0.9// - seg_len
			}
			if (_rope_len <= _dist_max) {
			*/
			var _rope_tension = false;
			with (o_newrope_controller) {
				rope_tension(0.4)
				_rope_tension = rope_tension_get()
			}
			if (_rope_tension) {
				speed_add(point_direction(x, y, o_newrope_source.x, o_newrope_source.y), 1);
				speed_limit(rope_pull_speed);
			}
			
			with (o_ship_winch_basic) {
				motion += 0.2;
			}
		}
		else if (!climb_aboard_confirmation) {
			self.set_climb_confirmation_active(true);
		}
	}
	
	if (_is_player) {
		var _rope_tension = false;
		with (o_newrope_controller) {
			_rope_tension = rope_tension_get(2)
			if (_rope_tension) {
				rope_tension(0.9)
			}
		}
		if (_rope_tension) {
			speed_add(
				point_direction(
					x, y,
					o_newrope_source.x, o_newrope_source.y
				),
				2
			)
		}
	}
}