x += hsp
y += vsp

hsp *= 0.9
vsp *= 0.9

if instance_exists(parent) {
	var _x2 = parent.x,
		_y2 = parent.y,
		_collision = collision_line(x, y, _x2, _y2, o_collision, true, false),
		_distance = point_distance(x, y, _x2, _y2),
		_cx = (x + _x2) * 0.5,
		_cy = (y + _y2) * 0.5
	
	if _distance > length {
		var _diff = _distance - length,
			_direction = point_direction(_x2, _y2, x, y)
		
		if (parent.object_index == o_rope_simple) {
			parent.hsp += ldrx(_diff * 0.5, _direction)
			parent.vsp += ldry(_diff * 0.5, _direction)
		}
		
		if (!attached) {
			hsp -= ldrx(_diff * 0.5, _direction)
			vsp -= ldry(_diff * 0.5, _direction)
		}
	}
	
	if _collision {
		var _normal = collision_find_normal(_cx, _cy + 1, 3, 3, _collision)
		
		if _normal != undefined {
			x -= _normal[0]
			y -= _normal[1]
			vsp = 0
		}
		
		parent.y += (y - parent.y) * 0.2
	}
	else if !attached && y < mcr_waterline {
		is_boated = false
		vsp += 0.1
	}
	
	stress = (_distance / length)
}