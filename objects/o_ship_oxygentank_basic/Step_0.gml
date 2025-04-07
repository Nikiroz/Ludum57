event_inherited();

interaction_active = (instance_exists(o_player) && o_player.aquasuit_equipped);

if (image_index >= (image_number - 1))
	interaction_active = false;