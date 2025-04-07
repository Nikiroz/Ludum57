event_inherited()

if (!is_grounded) {
	vsp += 0.05;
}
else if (is_submerged) {
	vsp += 0.01;
}
else vsp = 0;

var _rope = rope_instance

if (instance_exists(_rope)) {
	rope_instance.x = x;
	rope_instance.y = y;
}
else exit

with (target) {
	var _tx = x, _ty = bbox_bottom - 20,
		_is_player = (object_index == o_player);
	
	with (_rope) {
		if (stress > length && _is_player) {
			var _diff = stress - length
			other.hsp += ((x + parent.x) * 0.5 - _tx) * 0.2
			other.vsp += ((y + parent.y) * 0.5 - _ty) * 0.2
		}
		
		x = _tx
		y = _ty
	}
	
	//with (_rope) {
	//	if (stress > length && _is_player) {
	//		var _diff = stress - length,
	//			_hsp = ((x + parent.x) * 0.5 - _tx) * 0.2,
	//			_vsp = ((y + parent.y) * 0.5 - _ty) * 0.2,
	//			_excess = scr_rope_pull(_hsp, _vsp)
			
	//		if (_excess > 0) {
	//			var _direction = point_direction(
	//									0, 0, _hsp, _vsp)
				
	//			stress = max(0, stress - _excess);
				
	//			other.hsp += ldrx(_excess, _direction);
	//			other.vsp += ldry(_excess, _direction);
				
	//			game_end();
	//		}
	//		else {
	//			stress = 0;
	//		}
	//	}
		
	//	x = _tx
	//	y = _ty
	//}
	
	other.x = bbox_center_x;
	other.y = bbox_center_y;
}