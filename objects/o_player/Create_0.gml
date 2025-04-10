event_inherited();

hand_sprite = s_player_drive_hand_loop;

u_lightcolor = shader_get_uniform(shd_player, "u_lightcolor")
u_waterline = shader_get_uniform(shd_player, "u_waterline")
u_color = shader_get_uniform(shd_player, "u_color")
u_texel = shader_get_uniform(shd_player, "u_texel")
underwater_color = [30, 36, 33]
underwater_color[0] /= 255
underwater_color[1] /= 255
underwater_color[2] /= 255
lightcolor = [207, 203, 142]
lightcolor[0] /= 255
lightcolor[1] /= 255
lightcolor[2] /= 255
in_water = false /// Для анимации плюханья игрока
original_y = y;

// состояния
walking = false;
input_enabled = true;
walking_enabled = true;
motion_enabled = true;
boat_control = false;
oxygen_meter_active = false;
is_dead = false;

// экипировка
aquasuit_equipped = false;
lighter_available = false;

ungrounded_time = 0;

anim_aquasuit_equip = 0;
anim_aquasuit_ascend = 0;
anim_aquasuit_exit = 0;

// базовые хар-ки
event_user(0);
oxygen = oxygen_capacity;
oxygen_refilling = false;
hp = max_hp;
oxygenValue = 10;

// ввод и прочее
input_interact = false;
input_interact2 = false;
input_pull_up = false;

climb_aboard_confirmation = false;
confirmation_time = 0;

interaction_object = noone;
interaction_time = 0;
interaction_time_max = 0;
interaction_active = false;
interaction_release = false;
interaction2_active = false;
interaction_mode = 0;

ropeend_instance = noone;
carried_instance = noone;

///@function has_carried_item([check_object=undefined])
has_carried_item = function(_object = undefined) {
	if (is_undefined(_object))
		return instance_exists(carried_instance)
	
	return instance_is(carried_instance, _object)
}

///@function set_carried_item(instance)
set_carried_item = function(_instance = noone) {
	if (!aquasuit_equipped) exit;
	
	with (carried_instance) {
		depth = other.depth + 1;
		is_carried = false;
	}
	
	carried_instance = _instance;
	
	with (_instance) {
		depth = other.depth - 1;
		is_carried = true;
	}
}

/// @function set_climb_confirmation_active(active)
set_climb_confirmation_active = function(_active) {
	climb_aboard_confirmation = _active;
	input_enabled = !_active;
}

/// @function set_aquasuit_state(state)
set_aquasuit_state = function(_state) {
	if (aquasuit_equipped == _state) exit;
	
	var _player = id;
	
	aquasuit_equipped = _state;
	
	with (o_ship_aquasuit) {
		var _suit = id;
		
		is_equipped = _state;
		
		with (o_rope_end) {
			if (target == (_state ? _suit : _player)) {
				target = (_state ? _player : _suit);
				break;
			}
		}
	}
	
	if (!_state) {
		oxygen_meter_active = false;
	}
}

/// @function get_contextual_sprite(sprite)
get_contextual_sprite = function(_sprite) {
	if (has_carried_item()) {
		switch (_sprite) {
			case s_player_aquasuit_swim: return s_player_aquasuit_swim_hold;
			case s_player_aquasuit_groundtoswim: return s_player_aquasuit_groundtoswim_hold;
			case s_player_aquasuit_rope_end: return s_player_aquasuit_rope_end_hold;
			case s_player_aquasuit_swimtoground: return s_player_aquasuit_swimtoground_hold;
			case s_player_aquasuit_idle: return s_player_aquasuit_idle_hold;
			case s_player_aquasuit_walk: return s_player_aquasuit_walk_hold;
		}
	}
	
	return _sprite;
}

lock_next_to_aquasuit = function() {
	with (o_ship_aquasuit) {
		other.x = lerp(other.x, x + 7, 0.1);
		other.y = lerp(other.y, bbox_bottom + 8, 0.1);
	}
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

put_to_death = function() {
	is_dead = true;
	original_y = y;
	sprite_change(s_player_aquasuit_death);
	if(audio_is_playing(snd_low_oxygen_choking_d)){
		audio_stop_sound(snd_low_oxygen_choking_d);
		
		instance_create_layer(0, 0, layer_get_id("UI"), o_menu_dead);
		
	}
	audio_play_sound(snd_dead, 100, false, global.soundVolume);
	
}