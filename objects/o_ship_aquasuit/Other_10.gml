if (is_equipped || interactor.aquasuit_equipped) exit;

is_equipped = true;

var _suit = id;

with (interactor) {
	aquasuit_equipped = true;
	event_user(0);
	
	with (o_rope_end) {
		if (target == _suit) {
			target = other.id;
			break;
		}
	}
	
	// todo: убрать после добавления анимации надевания скафандра
	//{
		event_perform(ev_other, ev_animation_end);
		x = other.x - 90;
		y = other.y - 40;
	//}
}