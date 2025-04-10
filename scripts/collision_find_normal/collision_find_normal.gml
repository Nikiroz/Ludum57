function collision_find_normal(_x, _y, _rx, _ry, _instance) {
	var _cx = 0, _cy = 0
	
	for(var xx = -_rx; xx <= _rx; xx ++) {
		for(var yy = -_ry; yy <= _ry; yy ++) {
			if (position_meeting(_x + xx, _y + yy, _instance)) {
				_cx += _x + xx
				_cy += _y + yy
			}
		}
	}
	
	if _cx == 0 && _cy == 0 return undefined
	
	var _l = sqrt(_cx * _cx + _cy * _cy)
	
	var _nx = _cx / _l,
		_ny = _cy / _l
	
	return [ _nx, _ny ]
}