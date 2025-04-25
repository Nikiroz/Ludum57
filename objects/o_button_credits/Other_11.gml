instance_destroy(o_button_settings);
instance_destroy(o_button_start_game);
instance_create_layer(0,0,"UI",o_credits)

with(instance_create_layer(0,0,"UI",o_button_back)){
	_x = (gameWidth / 2) - (width / 2) - 3;
	_y = (gameHeight / 2) - (height / 2) + 100;	
	_ystart = _y;
}

instance_destroy();