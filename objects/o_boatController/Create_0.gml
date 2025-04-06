
boatSpeed = 0;
boatElements = []


var _layer = layer_get_id("Boat"),
	_elements = layer_get_all_elements(_layer);
	 
for (var i=0; i<array_length(_elements); i++)
{
	if (layer_get_element_type(_elements[i]) == layerelementtype_instance)
    {
		var _inst = layer_instance_get_instance(_elements[i]);
		array_push(boatElements, _inst);
    }
}

function move_boat(_x, _y)
{
	for (var i=0; i<array_length(boatElements); i++)
	{
		var _inst = boatElements[i];
		
		_inst.x += _x;
		
		//if (_inst.object_index != o_player)
			_inst.y += _y;
	}
}