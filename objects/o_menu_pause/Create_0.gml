
with(instance_create_layer(0, 0, "UI", o_button_lang_next)){
	_x			= gameWidth / 2 + 45;
	_y			= gameHeight / 2 - 38;
}

with(instance_create_layer(0, 0, "UI", o_button_lang_prev)){
	_x			= gameWidth / 2 - 60;
	_y			= gameHeight / 2 - 38;
}

with(instance_create_layer(0, 0, "UI", o_slider_soundVolume)){
	_x			= gameWidth / 2 - 50;
	_y			= gameHeight / 2;
}

with(instance_create_layer(0, 0, "UI", o_slider_musicVolume)){
	_x			= gameWidth / 2 - 50;
	_y			= gameHeight / 2 + 30
}

with(instance_create_layer(0, 0, "UI", o_label)){
	_x			= gameWidth / 2;
	_y			= gameHeight / 2 - 25;
	text		= "lang";
	scale		= 1;
}

with(instance_create_layer(0, 0, "UI", o_label)){
	_x			= gameWidth / 2;
	_y			= gameHeight / 2 - 45;
	text		= "langue";
	isSmall		= true; 
	
}

with(instance_create_layer(0, 0, "UI", o_label)){
	_x			= gameWidth / 2;
	_y			= 55;
	text		= "pause";
	isSmall		= false; 
	
}