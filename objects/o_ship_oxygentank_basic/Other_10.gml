if (image_index >= (image_number - 1)) exit;

with (interactor) {
	if (!aquasuit_equipped) break;
	
	sprite_index = s_player_oxygentank_change;
	image_index = 1;
	
	other.image_index ++;
}
