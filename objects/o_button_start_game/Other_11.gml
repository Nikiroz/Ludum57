global.isMainMenu = false;
o_player.isFreze = false;
o_game_controller.timeScale = 0.001;
o_mainMenu.isStart = true;
o_camera.target = o_player;
o_camera.isFrize = false;

instance_destroy(o_button_settings);
instance_destroy(o_button_title);
instance_destroy();