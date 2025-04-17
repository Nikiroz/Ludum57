/// @desc Update

var _x = x,
	_y = y;
with (o_newrope_controller) {
	start_x = _x
	start_y = _y
}

if (!inited) {
	inited = true
	
	with (o_newrope_controller) {
		repeat (2) rope_seg_add()
	}
	
	with (o_ship_aquasuit) {
		with (instance_create_layer(x, y, other.layer, o_newrope_end)) {
			target = other.id;
		}
	}
}

with (o_newrope_controller) {
	seg_array[0].x = _x
	seg_array[0].y = _y
}