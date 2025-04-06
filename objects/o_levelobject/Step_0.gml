//x += hsp;
//y += vsp;

var _gravity_factor = 1;

is_submerged = (bbox_center_y > mcr_waterline);

var _gravity_max = mcr_terminalVelocity * _gravity_factor;

if (vsp < _gravity_max) {
	vsp += mcr_gravity * _gravity_factor;
	
	if (vsp > _gravity_max) {
		vsp = _gravity_max;
	}
}

var _collide = move_and_collide(hsp, vsp, o_collision, 4),
	_collide_count = array_length(_collide);

var _ground = instance_place(x, bbox_bottom + 1, o_collision)

if (_ground != noone) {
	var _was_boated = false;
	
	is_grounded = true;
	ground_instance = _ground;
	
	is_boated = instance_is(_ground, o_collision_ship);
	
	if (!is_boated && _was_boated) {
		hsp += o_boatController.hsp;
		vsp += o_boatController.vsp;
	}
	
	if (!array_contains(_collide, _ground)) {
		array_push(_collide, _ground)
		_collide_count ++
	}
}
else {
	ground_instance = noone;
	is_grounded = false;
	is_boated = false;
}

//{
	for(var i = 0; i < _collide_count; i ++) {
		var _inst = _collide[i],
			_nx = (hsp ? bbox_right : bbox_left) + hsp,
			_ny = (vsp ? bbox_bottom : bbox_top) + vsp,
			_stepped_up = false
		
		if (hsp != 0 && place_meeting(_nx, bbox_bottom, _inst)) {
			var _step_size = 5, _offset = 0
			
			for(var i = 0; i <= _step_size; i ++) {
				if (!position_meeting(_nx, bbox_bottom - i, _inst)) break
				
				_offset ++
				
				_ny --
				y --
			}
			
			if (i >= _step_size) {
				_ny += _offset
				y += _offset
			}
			else _stepped_up = true
		}
		
		if (!_stepped_up) {
			while (hsp != 0 && place_meeting(_nx, y, _inst)) {
				hsp = approach(hsp, 0, 1);
			}
		}
		
		while (vsp != 0 && place_meeting(x, _ny, _inst)) {
			vsp = approach(vsp, 0, 1);
		}
		
		while (place_meeting(x, y, _inst)) {
			var _normal = collision_find_normal(x, bbox_bottom, bbox_width, 3, _inst)
			
			if (_normal == undefined) {
				y --; continue
			}
			
			x -= _normal[0]
			y -= _normal[1]
		}
		
		if (hsp == 0 && vsp == 0)
			break
	}
//}

if (is_grounded) {
	hsp *= ground_friction;
}
else hsp *= air_friction;

if (is_submerged) {
	vsp *= water_friction;
	hsp *= water_friction;
}

//if (abs(hsp) < 0.05) hsp = 0;

stable = (is_grounded || is_submerged);