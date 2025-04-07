function speed_add(_direction, _speed) {
	hsp += ldrx(_speed, _direction)
	vsp += ldry(_speed, _direction)
	direction = point_direction(0, 0, hsp, vsp)
}

function speed_multiply(_amount) {
	hsp *= _amount
	vsp *= _amount
}

function speed_get() {
	return sqrt(hsp * hsp + vsp * vsp)
}

function speed_getsqr() {
	return (hsp * hsp + vsp * vsp)
}

function speed_set(_hsp, _vsp) {
	hsp = _hsp
	vsp = _vsp
}

function speed_get_direction() {
	return point_direction(0, 0, hsp, vsp)
}

function speed_set_direction(_angle) {
	var _spd = speed_get()
	hsp = ldrx(_spd, _angle)
	vsp = ldry(_spd, _angle)
	direction = _angle
}

function speed_limit(_max_amount) {
	var _speed = min(_max_amount, speed_get()),
		_direction = speed_get_direction()
	
	hsp = ldrx(_speed, _direction)
	vsp = ldry(_speed, _direction)
}

function speed_friction(_friction) {
	hsp *= _friction
	vsp *= _friction
}
