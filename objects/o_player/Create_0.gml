vsp = 0;
horsp = 0;

status = {
	oxygen		 :100,   //Кислород
	hp			 :100,   //Здоровье
	speed		 :2,     //Скорость перемещения
	cable		 :20,    //Длина кабеля
	lightter	 :false, //Наличие фонаря
	impulceForce :1,	 //Сила откидывания предметов
	inCostume	 :false, //В костюме или нет
	inWater		 :false, //В воде или нет
	isFreeze     :false, //Забираем управление когда надо
	isWalk		 :false, //Управление когда надо
}

draw_set_font(fnt_debug);

rope_instance = noone;

is_climbing_rope = function() {
	return instance_exists(rope_instance);
}
