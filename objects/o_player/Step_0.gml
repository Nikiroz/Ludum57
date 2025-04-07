if (is_dead) exit;

var _left = false,
	_right = false,
	_hmove = 0;

input_pull_up = false;
input_interact = false;
input_interact2 = false;

if (input_enabled) {
	
	if (!boat_control && walking_enabled) {
		_left = keyboard_check(ord(leftKey));
		_right = keyboard_check(ord(rightKey));
		_hmove = _right - _left;
	}
	
	input_interact = keyboard_check_pressed(ord(actionKey));
	input_interact2 = keyboard_check_pressed(ord(action2Key));
	input_pull_up = keyboard_check(ord(upKey));
}

//
if (_hmove != 0) {
	var _spd = movement_speed;
	
	if (abs(hsp) < _spd) {
		hsp += _hmove * _spd;
		
		if (abs(hsp) > _spd) {
			hsp = sign(hsp) * _spd;
		}
	}
	
	walking = true;
	
	facing = _hmove;
}
else {
	walking = false;
}

event_inherited();

scr_interaction_update();


if (climb_aboard_confirmation) {
	vsp = (mcr_waterline - bbox_top - 6) * 0.2;
}

if (global.isDebug && mouse_check_button_pressed(mb_middle)) {
	x = mouse_x;
	y = mouse_y;
}

#region Стейтмашина

if (!is_grounded && is_submerged) {
	ungrounded_time ++;
}
else {
	ungrounded_time = 0;
}


if (instance_is(interaction_object, o_scrap) && interaction_time > 0) {
	if (!(sprite_index == s_player_aquasuit_scavenge_start ||
	sprite_index == s_player_aquasuit_scavenge_loop)) {
		
		sprite_index = s_player_aquasuit_scavenge_start;
		image_index = 0;
	}
}
else {
	var _swimming = (ungrounded_time > 5);
	
	// остановка анимации сбора
	if ((sprite_index == s_player_aquasuit_scavenge_start
	|| sprite_index == s_player_aquasuit_scavenge_loop)) {
		
		if (sprite_index != s_player_aquasuit_scavenge_end) {
			self.animation_reset();
			walking_enabled = true;
		}
	}
	
	// сброс анимации плавания
	if (!_swimming && sprite_index == s_player_aquasuit_swim) {
		self.animation_reset();
	}
	
	// анимация ходьбы
	if (aquasuit_equipped && is_submerged && _swimming) {
		if (sprite_index != s_player_aquasuit_swim)
			sprite_index = s_player_aquasuit_swim;
	}
	else if (walking) {
		if (aquasuit_equipped) {
			sprite_index = s_player_aquasuit_walk;
		}
		else {
			sprite_index = s_player_walk;
		}
	}
	else if (sprite_index == s_player_walk
	|| sprite_index == s_player_aquasuit_walk) {
		self.animation_reset();
	}
}

#endregion

#region Кислород

if (aquasuit_equipped && !climb_aboard_confirmation && is_submerged) {
	if (!oxygen_meter_active) {
		oxygen_meter_active = true;
		oxygen = oxygen_capacity;
	}
	
	if (oxygen > 0) {
		oxygen --;
		
		if (!oxygen) put_to_death();
	}
}

if (has_carried_item()) {
	var _tx = facing ? bbox_right : (bbox_left - 8),
		_ty = bbox_center_y + 4;
	
	with (carried_instance) {
		hsp = other.hsp;
		vsp = other.vsp;
		x = _tx;
		y = _ty;
	}
}

#endregion
