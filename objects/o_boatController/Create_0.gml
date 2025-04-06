
boatSpeed = 0;
boatElements = [];


boatSurface = surface_create(camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]))


isMoving = true;

hsp = 0;
vsp = 0;


var _layer = layer_get_id("Boat"),
	_elements = layer_get_all_elements(_layer);
	 
for (var i=0; i<array_length(_elements); i++)
{
	if (layer_get_element_type(_elements[i]) == layerelementtype_instance)
    {
		var _inst = layer_instance_get_instance(_elements[i]);
		
		if (_inst.object_index != o_boatController)
			array_push(boatElements, _inst);
		
    }
}

move_boat = function(_x) {
	var _element_count = array_length(boatElements)
	
	for (var i = 0; i < _element_count; i ++) {
		var _inst = boatElements[i];
		
		if ((instance_is(_inst, o_levelobject) || _inst.object_index == o_rope_simple) && !_inst.is_boated) continue
		
		_inst.x += _x;

	}

	
}