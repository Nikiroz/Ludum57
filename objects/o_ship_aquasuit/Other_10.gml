with (interactor) {
	x = other.x + 9;
	
	anim_aquasuit_equip = 0;
	sprite_index = s_player_aquasuit_enter;
	image_index = 0;
	
	if (other.is_equipped)
		image_index = 26;
	
	facing = facing_right;
}

is_equipped = true;

if (is_equipped) {
	scr_interactible_set_text("Continue diving");
}
else {
	scr_interactible_set_text("Start Diving");
}

scr_interactible_set_second_interaction(
	is_equipped, "Unequip");

scr_interactible_delete_text(id);

interaction_visible = false;
alarm[0] = 120;

//is_equipped = true;

//var _suit = id;

//with (interactor) {
//	set_aquasuit_state(true);
	
//	// todo: убрать после добавления анимации надевания скафандра
//	//{
//		x = other.x - 90;
//		y = other.y - 40;
//	//}
//}