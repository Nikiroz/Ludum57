x += hsp
y += vsp

hsp *= 0.9
vsp *= 0.9

if instance_exists(parent) {
	var _cx = (x + parent.x) * 0.5,
		_cy = (y + parent.y) * 0.5
	
	//
		var _collision = collision_line(x, y, parent.x, parent.y, o_collision, true, false)
		
		if _collision {
			var _normal = collision_find_normal(_cx, _cy + 1, 3, 3, _collision)
		
			if _normal != undefined {
				x -= _normal[0]
				y -= _normal[1]
				vsp = 0
			}
		}
		else if !attached && y < mcr_waterline {
			vsp += 0.1
		}
	//
}