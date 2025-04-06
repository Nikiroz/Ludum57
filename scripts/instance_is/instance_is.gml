function instance_is(_what, _who) {
	
	with (_what) {
		
		return object_index == _who or object_is_ancestor(object_index, _who)
	}
	
	return false
}