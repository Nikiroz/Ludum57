//x += hsp;
//y += vsp;

var _collide = move_and_collide(hsp, vsp, o_collision, 4, 0, 0, mcr_playerSpeed),
	_collide_count = array_length(_collide);

var _gravity_factor = 1;

//if (bbox_top < mcr_waterline) {
//	_gravity_factor = 0.1;
	
//	hsp *= water_friction;
//	vsp *= water_friction;
//}

var _gravity_max = mcr_terminalVelocity * _gravity_factor

if (vsp < _gravity_max) {
	vsp += mcr_gravity * _gravity_factor;
	
	if (vsp > _gravity_max) {
		vsp = _gravity_max;
	}
}

if (_collide_count) {
	var _cx = bbox_center_x,
		_cy = bbox_center_y
	
	for(var i = 0; i < _collide_count; i ++) {
		var _inst = _collide[i]
		
		if ((_inst.bbox_top > _cy && vsp < 0) || (_inst.bbox_bottom < _cy && vsp > 0)) {
			vsp = 0
		}
		
		if ((_inst.bbox_left > _cx && hsp < 0) || (_inst.bbox_right < _cx && hsp > 0)) {
			hsp = 0
		}
		
		if (hsp == 0 && vsp == 0)
			break
	}
}

hsp *= 0.33;
//vsp *= 0.9;

if (abs(hsp) < 0.05) hsp = 0;
//if (abs(vsp) < 0.05) vsp = 0;
