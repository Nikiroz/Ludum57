if(global.isDebug) {
    draw_text(32, 32, string(hour));
	
	with (o_sun) draw_text(32, 64, string(angle));

    if (keyboard_check(vk_control) && keyboard_check_pressed(ord("R"))) {
		instance_activate_all();
        game_restart();
    }

}


var _scavenge_amount = 0;

with (o_loot) {
	if (is_boated)
	{
		switch (part_size)
		{
		    case size.S:
				_scavenge_amount += 1;
		    break;
			case size.M:
				_scavenge_amount += 4;
		    break;
			case size.L:
				_scavenge_amount += 8;
		    break;
		}
	}
}

draw_reset_font();
draw_text(10, 10, "Loot: " + string(_scavenge_amount) + "$");