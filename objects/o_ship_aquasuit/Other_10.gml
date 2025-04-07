if (is_equipped || interactor.aquasuit_equipped) exit;

is_equipped = true;

with (interactor) {
	x = other.x + 9;
	
	anim_aquasuit_equip = 0;
	sprite_index = s_player_aquasuit_enter;
	image_index = 0;
	
	facing = facing_right;
}

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