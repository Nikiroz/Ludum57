/// @description Взаимодействие 2

if (boatControl || !interaction2_active) exit;

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

global.scavenge = _scavenge_amount;
global.fuel = -o_boatController.fuel_lost;

with (o_player) {
	global.oxygen = -(oxygen / oxygen_capacity <= 0.5)
}

with (o_ship_oxygentank_basic) {
	if (image_index > 0)
		global.oxygen -= floor(image_index);
}

with (o_game_controller) {
	event_user(0);
}
room_goto(r_Statistics);
global.isPause = true;
