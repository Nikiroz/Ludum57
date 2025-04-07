if (sprite_index == s_player_aquasuit_scavenge_end) {
	if(audio_is_playing(snd_scrap_metal_dismantling_loop)){
		audio_stop_sound(snd_scrap_metal_dismantling_loop);
	}
	walking_enabled = true;
}

//

if (sprite_index == s_player_aquasuit_ascend) {
	if (has_carried_item()) {
		sprite_index = s_player_aquasuit_exit_drop_item;
		
		with (carried_instance) {
			hsp = 3 + random(3);
			vsp = 2 + random(1);
			
			x = other.x + 15;
			y = other.y - 20;
		}
		
		interaction_object = noone;
		set_carried_item(noone);
	}
	else {
		//sprite_index = s_player_aquasuit_exit;
		sprite_index = s_player_aquasuit_idle;
	}
}
else if (sprite_index == s_player_aquasuit_exit_drop_item) {
	sprite_index = s_player_aquasuit_idle;
	facing = facing_left;
	is_grounded = true;
	stable = true;
}
//else if (sprite_index == s_player_aquasuit_exit_drop_item) {
//	sprite_index = s_player_aquasuit_exit;
//}
else if (sprite_index == s_player_aquasuit_enter) {
	sprite_index = s_player_aquasuit_enter_dive;
}
else if (sprite_index == s_player_aquasuit_enter_dive) {
	sprite_index = s_player_aquasuit_swim;
	facing = -facing;
}
else if (sprite_index == s_player_drive_start)
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
	if(!audio_is_playing(snd_scrap_metal_dismantling_loop)){
		audio_play_sound(snd_scrap_metal_dismantling_loop, 1, true, global.soundVolume);
	};
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
else if (sprite_index == s_player_aquasuit_swimtoground) {
	sprite_index = s_player_aquasuit_idle;
}
else if (!walking) {
	if (aquasuit_equipped) {
		if (!is_grounded && is_submerged) {
			sprite_index = s_player_aquasuit_swim;
		}
		else {
			if (sprite_index == s_player_aquasuit_swim) {
				sprite_index = s_player_aquasuit_swimtoground;
				image_index = 0;
			}
			else sprite_index = s_player_aquasuit_idle;
		}
	}
	else {
		sprite_index = choose(s_player_idle, s_player_idle, s_player_idle, s_player_idle_headturn);
	}
}