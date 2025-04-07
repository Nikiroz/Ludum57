if (is_equipped || interactor.aquasuit_equipped) exit;

is_equipped = true;

var _suit = id;

with (interactor) {
	set_aquasuit_state(true);
	
	// todo: убрать после добавления анимации надевания скафандра
	//{
		x = other.x - 90;
		y = other.y - 40;
	//}
}