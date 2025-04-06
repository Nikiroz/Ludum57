var _last = id,
	_x = bbox_center_x,
	_y = bbox_center_y,
	_layer = layer

for(var i = 0; i < ropeSegmentCount; i ++) {
	var _offset = min(i, 32)
	
	var _inst = instance_create_layer(
		_x + _offset * 2, _y + _offset * 3, _layer, o_rope_simple)
	
	_inst.parent = _last
	
	_last = _inst
}

with (_last) {
	with (o_ship_aquasuit) {
		with (instance_create_layer(x, y, _layer, o_rope_end)) {
			rope_instance = _last;
			target = other.id;
		}
	}
	
	attached = true;
}
