function scr_instance_check_boated(_inst, _default = true) {
	if (instance_exists(_inst) && (instance_is(_inst, o_levelobject) || _inst.object_index == o_rope_simple)) {
		return _inst.is_boated;
	}
	
	return _default;
}