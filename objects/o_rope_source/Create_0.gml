var _last = id

for(var i = 0; i < ropeSegmentCount; i ++) {
	var _inst = instance_create_depth(x, y + i * 4, 5, o_rope_simple)
	_inst.parent = _last
	_last = _inst
}

with o_player {
	rope_instance = _last
	_last.attached = true
}
