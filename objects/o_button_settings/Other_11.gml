instance_destroy(o_button_title);
instance_destroy(o_button_start_game);


with(instance_create_layer(0, 0, "UI", o_slider_soundVolume)){
	
	_x			= gameWidth / 2 - 50;
	_y			= gameHeight / 2 - 30;
	labelOffset = 25;
	
}

with(instance_create_layer(0, 0, "UI", o_slider_musicVolume)){
	
	_x			= gameWidth / 2 - 50;
	_y			= gameHeight / 2;
	labelOffset = 25;
	
}

with(instance_create_layer(0, 0, "UI", o_button_back)){
	_y = (gameHeight / 2) - (height / 2) + 40;
	_ystart = _y;
}
instance_destroy();