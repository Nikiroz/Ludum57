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

density = 4;

walking = false;

ropeend_instance = noone;
carried_instance = noone;

input_interact = false;

///@function has_carried_item([check_object=undefined])
has_carried_item = function(_object = undefined) {
	if (is_undefined(_object))
		return instance_exists(carried_instance)
	
	return instance_is(carried_instance, _object)
}

interaction_object = noone;
interaction_progress = 0;
interaction_time_max = 0;
interaction_active = false;
interaction_release = false;