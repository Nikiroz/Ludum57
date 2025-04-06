var _left = false,
	_right = false,
	_jump = false,
	_hmove = 0;

input_interact = false;

if (input_enabled) {
	
	if (!boat_control && walking_enabled) {
		_left = keyboard_check(ord(leftKey));
		_right = keyboard_check(ord(rightKey));
		_jump = keyboard_check_pressed(jumpKey);
		_hmove = _right - _left;
	}
	
	input_interact = keyboard_check_pressed(ord(actionKey));
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

if (_jump) vsp = mcr_playerJumpForce;



event_inherited();

scr_interaction_update();

if (global.isDebug && mouse_check_button_pressed(mb_middle)) {
	x = mouse_x;
	y = mouse_y;
}

#region Стейтмашина

if (walking) {
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

#endregion