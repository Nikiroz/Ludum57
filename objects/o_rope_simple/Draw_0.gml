var _distance = 0

if instance_exists(parent) {
	var _distance = point_distance(x, y, parent.x, parent.y)
	
	if _distance > length {
		var _diff = _distance - length,
			_direction = point_direction(
				parent.x, parent.y, x, y)
		
		if (parent.object_index == o_rope_simple) {
			parent.hsp += ldrx(_diff * 0.5, _direction)
			parent.vsp += ldry(_diff * 0.5, _direction)
		}
		
		if (!attached) {
			hsp -= ldrx(_diff * 0.5, _direction)
			vsp -= ldry(_diff * 0.5, _direction)
		}
	}
	
	draw_line_width(x, y, parent.x, parent.y, 3)
	
	stress = (_distance / length)
	
	//if parent.object_index == o_rope_simple {
	//	accumulated_distance = parent.accumulated_distance + (_distance / length)
	//}
	//else accumulated_distance = (_distance / length)
}

//draw_set_color(c_red)

//draw_set_font(fnt_debug_small)
//draw_text(x, y, stress)

//draw_set_color(c_white)