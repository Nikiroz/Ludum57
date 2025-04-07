if (sprite_index == s_player_aquasuit_scavenge_end) {
	walking_enabled = true;
}

//

if (sprite_index == s_player_drive_start)
{
	sprite_index = s_player_drive_loop;
	hand_sprite = s_player_drive_hand_loop;
}
else if (sprite_index == s_player_drive_loop)
{
	sprite_index = s_player_drive_loop;
	hand_sprite = s_player_drive_hand_loop;
}
else if (sprite_index == s_player_aquasuit_scavenge_start) {
	sprite_index = s_player_aquasuit_scavenge_loop;
	walking_enabled = false;
}
else if (sprite_index == s_player_aquasuit_scavenge_loop) {
	sprite_index = s_player_aquasuit_scavenge_loop;
}
else if (sprite_index == s_player_drive_end)
{
	sprite_index = s_player_idle;
}
else if (!walking) {
	if (aquasuit_equipped) {
		if (!is_grounded && is_submerged) {
			sprite_index = s_player_aquasuit_swim;
		}
		else {
			sprite_index = s_player_aquasuit_idle;
		}
	}
	else {
		sprite_index = choose(s_player_idle, s_player_idle, s_player_idle, s_player_idle_headturn);
	}
}