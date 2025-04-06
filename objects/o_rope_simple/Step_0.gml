x += hsp
y += vsp

hsp *= 0.9
vsp *= 0.9

if instance_exists(parent) {
	var _collision = collision_line(x, y, parent.x, parent.y, o_collision, true, false)
	
	if _collision {
		var _cx, _cy;
		
		with _collision {
			_cx = (bbox_left + bbox_right) * 0.5
			_cy = (bbox_top + bbox_bottom) * 0.5
		}
		
		var _distance = point_distance(x, y, _cx, _cy)
		
		x += (x - _cx) / _distance
		y += (y - _cy) / _distance
	}
	else if !attached && y < mcr_waterline {
		vsp += 0.1
	}
}