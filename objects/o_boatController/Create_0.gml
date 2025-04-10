start_point = x;
boatWavesShift = 0;
boatSpeed = 0;
boatElements = [];

boatAngle = 0;
boatSurface = -1
fuel_lost = 0;

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

array_foreach(_elements, function(_element) {
	if (layer_get_element_type(_element) != layerelementtype_instance) exit;
    
	var _inst = layer_instance_get_instance(_element),
		_object = _inst.object_index;
		
	if (_object == o_boatController
		|| _object == o_rope_simple
		|| _object == o_rope_end)
	{
		exit;
	}
		
	array_push(boatElements, _inst);
})

move_boat = function(_x) {
	var _element_count = array_length(boatElements)
	
	for (var i = 0; i < _element_count; i ++) {
		var _inst = boatElements[i];
		
		if (scr_instance_check_boated(_inst)) {
			_inst.x += _x;
		}
	}
	
	fuel_lost += abs(_x / 1000);
	

		if (random(100) < 5 * abs(_x)) {
			instance_create_layer(o_shipBG.x + 185, o_shipBG.y - 158, "Boat", o_ship_smoke)
		}
	
	
	if (abs(_x) > 0.2) {
		with (instance_single_get(o_ship_part01.x, o_ship_part01.y, depth, o_ship_waves_movement)) {
			scale_x = sign(_x)
		}
		with (instance_single_get(o_ship_part01.x, o_ship_part01.y, depth, o_ship_waves_stripe)) {
			scale_x = sign(_x)
		}
	} else {
		with (o_ship_waves_movement) {
			to_end = true
		}
		with (o_ship_waves_stripe) {
			to_end = true
		}
	}
}