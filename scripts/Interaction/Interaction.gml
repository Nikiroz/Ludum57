function scr_interaction_update() {
	var _interact = input_interact,
		_interacting = false
	
	if (keyboard_check(ord(actionKey))) {
		if (!interaction_release)
			_interacting = true;
	}
	else interaction_release = false;
	
	if (instance_exists(interaction_object) && (!interaction_object.interaction_time_max || _interacting)) {
		var _obj = interaction_object,
		
		if (distance_to_object(interaction_object) > interaction_object.interaction_range) {
			interaction_object = noone
			exit
		}
		
		var _time_max = _obj.interaction_time_max,
			_complete = false;
		
		if (interaction_progress >= _time_max && (_time_max ? _interacting : _interact)) {
			with (_obj) {
				other.interaction_progress = 0;
				other.interaction_time_max = 0;
				other.interaction_release = true;
				interactor = other.id
				event_user(0)
			}
		}
		else if (_interacting && _time_max) {
			interaction_progress ++
		}
	}
	else {
		if (interaction_progress > 0) {
			interaction_progress = lerp(interaction_progress, 0, 0.2);
			
			if (interaction_progress < 1)
				interaction_progress = 0;
		}
		
		var _distance_max = infinity, _result = noone,
			_x = bbox_center_x, _y = bbox_center_y;
		
		with (o_interactible) {
			var _distance = distance_to_point(_x, _y)
			
			if (_distance > interaction_range || collision_line(x, y, _x, _y, o_collision, true, false)) continue
			
			if (_distance < _distance_max) {
				_distance_max = _distance
				_result = id
			}
		}
		
		interaction_object = _result
	}
}
