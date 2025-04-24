/// @description Конец дня

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

with (interactor)
{
	walking_enabled = !walking_enabled;
	
	if (!walking_enabled) {
		sprite_index = s_player_drive_start;
		hand_sprite = s_player_drive_hand_start;
		facing = 1;
	}
	else {
		sprite_index = s_player_drive_end;
		hand_sprite = s_player_drive_hand_end;
	}
		
}

sprite_index = s_father_drive_start;

if(!audio_is_playing(snd_boat_start2)){
	audio_play_sound_on(global.soundEmitter, snd_boat_start2, false, 1);
}
startEngine = true;
alarm[0] = 60;	

boatControl=true;
isEndDay = true;
o_camera.target = o_camera;

instance_create_layer(0, 0, "UI", o_menu_statistics);
