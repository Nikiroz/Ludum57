var left = keyboard_check(ord(leftKey)),
	right = keyboard_check(ord(rightKey)),
	jump = keyboard_check_pressed(jumpKey),
	_hmove = right - left;

if (_hmove != 0) {
	hsp += _hmove * mcr_playerSpeed;
	facing = _hmove;
	walking = true;
}
else walking = false;

if(jump){
	vsp = mcr_playerJumpForce;
	
	if (bbox_bottom > mcr_waterline) {
		vsp *= 0.33;
	}
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
}

#region Стейтмашина

if (walking) {
	sprite_index = s_player_walk;
}
else if (sprite_index == s_player_walk) {
	sprite_index = s_player_idle;
}

#endregion