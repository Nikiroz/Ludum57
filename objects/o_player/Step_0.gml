var left = keyboard_check(ord(leftKey)),
	right = keyboard_check(ord(rightKey)),
	jump = keyboard_check_pressed(jumpKey),
	_hmove = right - left;

input_interact = keyboard_check_pressed(ord(actionKey))

if (_hmove != 0) {
	if (abs(hsp) < mcr_playerSpeed) {
		hsp += _hmove * mcr_playerSpeed;
		
		if (abs(hsp) > mcr_playerSpeed) {
			hsp = sign(hsp) * mcr_playerSpeed;
		}
	}
	
	facing = _hmove;
	walking = true;
}
else walking = false;

if(jump){
	vsp = mcr_playerJumpForce;
}

event_inherited();

if (instance_exists(rope_instance)) {
	var _max_distance = (instance_number(o_rope_simple) * ropeSegmentLength) * 6
	
	with (rope_instance) {
		var _tx = other.x, _ty = other.bbox_bottom - 20
		
		if (stress > length) {
			var _diff = stress - length
			other.hsp += ((x + parent.x) * 0.5 - _tx) * 0.2
			other.vsp += ((y + parent.y) * 0.5 - _ty) * 0.2
		}
		
		x = _tx
		y = _ty
	}
	
	if (input_interact) {
		with (rope_instance)
			attached = false;
		
		rope_instance = noone;
		
		input_interact = false;
	}
}

scr_interaction_update();








#region Стейтмашина

if (walking) {
	sprite_index = s_player_walk;
}
else if (sprite_index == s_player_walk) {
	sprite_index = s_player_idle;
}

#endregion