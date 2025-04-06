var left = keyboard_check(ord(leftKey));
var right = keyboard_check(ord(rightKey));
var jump = keyboard_check_pressed(jumpKey);
 
horsp += (right - left) * mcr_playerSpeed;

if(jump){
	vsp = mcr_playerJumpForce;
}
if(sign(horsp) != 0){
	image_xscale = sign(horsp);
}
vsp += mcr_gravity;
vsp = clamp(vsp, mcr_maxGravity);

if (array_length(move_and_collide(horsp, vsp, o_collision, 4, 0, 0, mcr_playerSpeed))) != 0 {
	vsp = 0
}

horsp *= 0.33

if (instance_exists(rope_instance)) {
	//var _max_distance = (instance_number(o_rope_simple) * ropeSegmentLength) * 4
	
	with (rope_instance) {
		//print(accumulated_distance, _max_distance)
		
		var _tx = other.x, _ty = other.bbox_bottom - 20
		
		//if accumulated_distance >= _max_distance {
		//	other.horsp += x - _tx
		//	other.vsp += y - _ty
			
		//	print(y - _ty)
		//}
		
		x = _tx
		y = _ty
	}
}