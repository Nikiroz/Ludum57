function scr_interaction_update() {
	var _interact = input_interact,
		_interacting = false
	
	if (keyboard_check(ord(actionKey))) {
		if (!interaction_release)
			_interacting = true;
	}
	else interaction_release = false;
	
	if (instance_exists(interaction_object) && stable
	&& (!interaction_object.interaction_time_max || _interacting)
	&& interaction_object.stable)
	{
		var _obj = interaction_object,
		
		if (distance_to_object(_obj) > _obj.interaction_range || (sign(_obj.x - bbox_center_x) != facing)) {
			interaction_object = noone;
			exit
		}
		
		var _time_max = _obj.interaction_time_max,
			_complete = false;
		
		if (interaction_progress >= _time_max && (_time_max ? _interacting : _interact)) {
			with (_obj) {
				other.interaction_progress = 0;
				other.interaction_time_max = 0;
				other.interaction_release = true;
				interactor = other.id;
				event_user(0);
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
			_x = bbox_center_x, _y = bbox_center_y,
			_facing = facing;
		
		with (o_interactible) {
			var _distance = distance_to_point(_x, _y)
			
			if (sign(x - _x) != _facing || _distance > interaction_range || collision_line(x, y, _x, _y, o_collision, true, false) || !stable) continue
			
			if (_distance < _distance_max) {
				_distance_max = _distance
				_result = id
			}
		}
		
		interaction_object = _result
	}
}

function scr_interactible_check_selected(_instance) {
	
	return (instance_is(_instance, o_interactible)
		&& o_player.interaction_object == _instance
		&& !o_player.interaction_release)
}

function scr_interactible_draw_self_outlined(_outline_flags = outline_full) {
	draw_sprite_outline(scr_interactible_check_selected(id) ? _outline_flags : 0,
		sprite_index, image_index, x , y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
}

/// @function scr_interactible_configure
/// @param [interaction_delay=0]
/// @param [distance=20]
function scr_interactible_configure(_delay = 0, _distance = 20) {
	interaction_time_max = _delay
	interaction_range = _distance
}