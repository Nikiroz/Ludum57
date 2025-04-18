global.isMainMenu			= false;
o_player.input_enabled		= true;
o_game_controller.timeScale = 0.001;
o_mainMenu.isStart			= true;
o_camera.target				= o_player;

with(o_sound_controller){
	event_user(4);
}

instance_destroy(o_button_settings);
instance_destroy(o_button_title);
instance_destroy();