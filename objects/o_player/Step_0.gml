var left = 0,
	right = 0,
	jump = 0;
	
if !(status.isFreeze) {
	
	left = keyboard_check(ord(leftKey));
	right = keyboard_check(ord(rightKey));
	jump = keyboard_check_pressed(jumpKey);
	
}

hsp += (right - left) * mcr_playerSpeed;

event_inherited();

//print("player:", hsp)

status.isWalk = (left || right);

if(jump){
	vsp = mcr_playerJumpForce;
	
	if (bbox_bottom > mcr_waterline) {
		vsp *= 0.33;
	}
}

if (hsp != 0) facing = sign(hsp)

if (instance_exists(rope_instance)) {
	//var _max_distance = (instance_number(o_rope_simple) * ropeSegmentLength) * 4
	
	with (rope_instance) {
		//print(accumulated_distance, _max_distance)
		
		var _tx = other.x, _ty = other.bbox_bottom - 20
		
		//if accumulated_distance >= _max_distance {
		//	other.hsp += x - _tx
		//	other.vsp += y - _ty
			
		//	print(y - _ty)
		//}
		
		x = _tx
		y = _ty
	}
}
	
#region Стейтмашина
	
if (!status.isFreeze) {
    if (status.isWalk) {
		sprite_index = s_player_walk;
	} else {
		if (sprite_index == s_player_walk){
			sprite_index = s_player_idle;
		}
	}
}

#endregion