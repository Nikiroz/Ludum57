if(global.isDebug) {
    draw_text(32, 32, string(hour));
	
	with (o_sun) draw_text(32, 64, string(angle));

    if (keyboard_check(vk_control) && keyboard_check_pressed(ord("R"))) {
		instance_activate_all();
        game_restart();
    }
}

if(global.isPause && sprite_exists(screenshot_sprite)) {
	draw_sprite_ext(screenshot_sprite, 0, 0, 0, 1, 1, 0, c_white, 1);
}