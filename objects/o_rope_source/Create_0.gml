var _last = id,
	_x = bbox_center_x,
	_y = bbox_center_y

for(var i = 0; i < ropeSegmentCount; i ++) {
	var _inst = instance_create_depth(_x, _y + i * 4, 5, o_rope_simple)
	_inst.parent = _last
	_last = _inst
}

with o_player {
	rope_instance = _last
	_last.attached = true
}
