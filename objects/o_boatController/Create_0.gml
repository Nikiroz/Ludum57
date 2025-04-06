
boatSpeed = 0;
boatElements = [];


boatSurface = -1;

__reset_surface = function() {
	boatSurface = surface_create(
		camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
}


self.__reset_surface();

isMoving = true;

hsp = 0;
vsp = 0;


var _layer = layer_get_id("Boat"),
	_elements = layer_get_all_elements(_layer);
	 
for (var i=0; i<array_length(_elements); i++)
{
	if (layer_get_element_type(_elements[i]) == layerelementtype_instance)
    {
		var _inst = layer_instance_get_instance(_elements[i]),
			_object = _inst.object_index;
		
		if (_object == o_boatController
			|| _object == o_rope_source
			|| _object == o_rope_simple
			|| _object == o_rope_end)
		{
			continue;
		}
		
		array_push(boatElements, _inst);
    }
}

move_boat = function(_x) {
	var _element_count = array_length(boatElements)
	
	for (var i = 0; i < _element_count; i ++) {
		var _inst = boatElements[i];
		
		if (scr_instance_check_boated(_inst)) {
			_inst.x += _x;
		}
	}

	
}