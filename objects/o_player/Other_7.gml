if (sprite_index == s_father_drive_start)
{
	sprite_index = s_father_drive_loop;
}
else if (sprite_index == s_father_drive_loop)
{
	sprite_index = s_father_drive_loop;
}
else if (sprite_index == s_father_drive_end)
{
	sprite_index = s_player_idle;
}
else if (!walking) {
	if (aquasuit_equipped) {
		sprite_index = s_player_aquasuit_idle;
	}
	else {
		sprite_index = choose(s_player_idle, s_player_idle, s_player_idle, s_player_idle_headturn);
	}
}