/// @func instance_single_get(_x, _y, _depth, _obj)
function instance_single_get(_x, _y, _depth, _obj) {
	
	if (instance_exists(_obj)) {
		return _obj.id
	}
	
	return instance_create_depth(_x, _y, _depth, _obj)
	
}