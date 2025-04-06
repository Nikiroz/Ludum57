if(global.isDebug){
	draw_text(32, 32, string(hour));
	draw_text(32, 64, string(o_sun.angle));
	
	if (keyboard_check(vk_control) && keyboard_check_pressed(ord("R"))) {
		game_restart();
	}
}
