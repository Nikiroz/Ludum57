with (o_loot) {
	if (is_boated) instance_destroy();
}

global.dayNumbers++;
room_goto(r_Game)