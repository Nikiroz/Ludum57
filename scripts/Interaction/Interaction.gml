function scr_interaction_update() {
	var _interact = input_interact,
		_interacting = false,
		_mode = -1;
	
	if (keyboard_check(ord(actionKey))) {
		if (!interaction_release) {
			_interacting = true;
		}
	}
	else interaction_release = false;
	
	if (instance_exists(interaction_object) && interaction2_active && input_interact2) {
		with (interaction_object) {
			other.interaction_time = 0;
			other.interaction_time_max = 0;
			other.interaction_release = true;
			interactor = other.id;
			
			event_user(1);
		}
		
		interaction_time = 0;
		interaction_time_max = 0;
	}
	else if (instance_exists(interaction_object)
	&& interaction_object.interaction_active
	&& (stable || !interaction_object.interaction_time_max)
	&& ((!interaction_object.interaction_time_max || _interacting))) {
		var _obj = interaction_object
		
		if (distance_to_object(_obj) > _obj.interaction_range || (sign(_obj.x - bbox_center_x) != facing)) {
			interaction_object = noone;
			exit
		}
		
		var _time_max = _obj.interaction_time_max,
			_complete = false;
		
		if (interaction_time >= _time_max && (_time_max ? _interacting : _interact)) {
			with (_obj) {
				other.interaction_time = 0;
				other.interaction_time_max = 0;
				other.interaction_release = true;
				interactor = other.id;
				
				event_user(0);
			}
		}
		else if (_interacting && _time_max) {
			interaction_time ++
		}
	}
	else {
		if (interaction_time > 0) {
			interaction_time = lerp(interaction_time, 0, 0.2);
			
			if (interaction_time < 1)
				interaction_time = 0;
		}
		
		interaction2_active = false;
		
		var _result = noone
		
		if (stable) {
			var _distance_max = infinity,
				_x = bbox_center_x, _y = bbox_center_y,
				_facing = facing;
			
			with (o_interactible) {
				if (!(interaction_active || interaction2_active)) continue;
				
				var _distance = distance_to_point(_x, _y),
					_px = bbox_center_x, _py = bbox_center_y
				
				//if (keyboard_check_pressed(vk_space)) {
				//	print(id, object_get_name(object_index), interaction_active,
				//		sign(_px - _x) == _facing, _distance <= interaction_range,
				//		collision_line(_px, _py, _x, _y, o_collision, true, false), stable);
				//}
				
				if (sign(_px - _x) != _facing || _distance > interaction_range || collision_line(_px, _py, _x, _y, o_collision, true, false) || !stable) continue
			
				if (_distance < _distance_max) {
					_distance_max = _distance
					_result = id
				}
			}
		}
		
		interaction_object = _result
	}
	
	var _obj = interaction_object, _any = false;
	
	if (instance_exists(_obj) && _obj.interaction_visible) {
		interaction_time_max = _obj.interaction_time_max;
		interaction2_active = _obj.interaction2_active;
		
		with (o_interaction_text) {
			if (target == _obj) {
				_any = true;
				break;
			}
		}
		
		if (!_any) {
			with (instance_create_depth(x, y, -100, o_interaction_text))
				target = _obj;
		}
	}
}

function scr_interactible_check_selected(_instance) {
	with (o_player) {
		return (instance_is(_instance, o_interactible) && (_instance.interaction_active || _instance.interaction2_active)
			&& interaction_object == _instance && !interaction_release) && stable
	}
	
	return false
}

function scr_interactible_draw_self_outlined(_outline_flags = outline_full) {
	
	if (interaction_visible) {
		draw_sprite_outline(scr_interactible_check_selected(id) ? _outline_flags : 0,
			sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	else {
		draw_self();
	}
}

function scr_interactible_delete_text(_instance) {
	
	with (o_interaction_text) {
		
		if (target == _instance)
			instance_destroy();
	}
}

/// @function scr_interactible_configure
/// @param [interaction_delay=0]
/// @param [distance=20]
function scr_interactible_configure(_delay = 0, _distance = 20) {
	interaction_time_max = _delay
	interaction_range = _distance
}

function scr_interactible_set_text(_hint = "N/A", _progress = "N/A {0}%") {
	interaction_text_hint = _hint;
	interaction_text_progress = _progress;
}

function scr_interactible_set_second_interaction(_active, _hint = "N/A", _progress = "N/A {0}%") {
	interaction2_active = _active;
	interaction2_text_hint = _hint;
	interaction2_text_progress = _progress;
}