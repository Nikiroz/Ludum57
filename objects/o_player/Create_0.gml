event_inherited();

// состояния
walking = false;
input_enabled = true;
walking_enabled = true;
motion_enabled = true;
boat_control = false;

// экипировка
aquasuit_equipped = false;
lighter_available = false;


// базовые хар-ки
event_user(0);
hp = max_hp;


// ввод и прочее
input_interact = false;

interaction_object = noone;
interaction_progress = 0;
interaction_time_max = 0;
interaction_active = false;
interaction_release = false;

ropeend_instance = noone;
carried_instance = noone;

///@function has_carried_item([check_object=undefined])
has_carried_item = function(_object = undefined) {
	if (is_undefined(_object))
		return instance_exists(carried_instance)
	
	return instance_is(carried_instance, _object)
}


//

/// @function sprite_change(sprite)
sprite_change = function(_sprite) {
	sprite_index = _sprite;
	image_index = 0;
}

/// @function animation_reset()
animation_reset = function() {
	image_index = 0;
	event_perform(ev_other, ev_animation_end);
}