event_inherited();

status = {
	oxygen :       100,              //Кислород
	hp :           100,              //Здоровье
	speed :        2,                //Скорость перемещения
	cable :        ropeSegmentCount, //Длина кабеля
	lightter :     false,            //Наличие фонаря
	impulceForce : 1,	             //Сила откидывания предметов
	inCostume :    false,            //В костюме или нет
	inWater :      false,            //В воде или нет
	isFreeze :     false,            //Забираем управление когда надо
	isWalk :       false,            //Управление когда надо
}

draw_set_font(fnt_debug);

walking = false;

rope_instance = noone;
carried_instance = noone;

///@function is_climbing_rope()
is_climbing_rope = function() {
	return instance_exists(rope_instance);
}

///@function has_carried_item([check_object=undefined])
has_carried_item = function(_object = undefined) {
	if (is_undefined(_object))
		return instance_exists(carried_instance)
	
	return instance_is(carried_instance, _object)
}