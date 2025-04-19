if(global.isDebug) {
    draw_text(32, 12, string(global.locale));
    draw_text(32, 32, string(hour));
	
	with (o_sun) draw_text(32, 64, string(angle));

    if (keyboard_check(vk_control) && keyboard_check_pressed(ord("R"))) {
		instance_activate_all();
        game_restart();
    }

}

