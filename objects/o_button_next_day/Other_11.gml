with (o_loot) {
	if (is_boated) instance_destroy();
}

global.dayNumbers++;
global.restartTime = true;
room_goto(r_Game)