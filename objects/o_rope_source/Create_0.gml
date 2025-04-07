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

rope_length_max = ropeSegmentCount
rope_length_min = rope_length_max div 2

rope_length = rope_length_min

rope_ref = noone

//extend_rope = function() {
//	var _previous = rope_ref,
//		_inst = instance_create_layer(
//			x, y, layer, o_rope_simple);
	
//	if (instance_exists(_previous))
//		_previous.parent = _inst
	
//	_inst.child = _previous
//	_inst.parent = id
	
//	rope_ref = _inst
//	return _previous
//}

//retract_rope = function() {
//	if (!instance_exists(rope_ref)) exit
	
//	var _child = rope_ref.child
//	instance_destroy(rope_ref)
	
//	if (instance_exists(_child)) {
//		_child.parent = id
//		rope_ref = _child
//	}
//	else {
//		rope_ref = noone
//	}
//}

//var _last;

//repeat (rope_length) {
//	_last = extend_rope();
//}

with (_last) {
	with (o_ship_aquasuit) {
		with (instance_create_layer(x, y, other.layer, o_rope_end)) {
			rope_instance = _last;
			target = other.id;
		}
	}
	
	attached = true;
}

