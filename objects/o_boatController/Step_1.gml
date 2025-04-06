var _layer = layer_get_id("Boat"),
	_elements = layer_get_all_elements(_layer);
	 
for (var i=0; i<array_length(_elements); i++)
{
	
	if (layer_get_element_type(_elements[i]) == layerelementtype_instance)
    {
		var _inst = layer_instance_get_instance(_elements[i]);
        _inst.x++;
		
		if (_inst.object_index != o_player)
			_inst.y += cos(current_time / 200) / 10;
    }
	
}