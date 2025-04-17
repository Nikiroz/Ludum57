if(!global.isMainMenu){
	o_player.isFreze = false;
	o_game_controller.timeScale = 0.001;
	o_mainMenu.isStart = true;
	o_camera.target = o_player;
	o_camera.isFrize = false;
	instance_create_layer(0,0,"UI",o_fade)
	instance_destroy();
	exit;
}

event_user(1);

fade = 0.6;
alpha = 1.0;
isStart = false;
