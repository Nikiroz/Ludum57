//repeat (size * random_range(2, 3)) {
	var _loot_type = scr_deicde_loot();
	
	with (instance_create_depth(x, y, depth - 1, _loot_type)) {
		speed_add(random(360), random(3));
		float_level = y - random(32);
		x += hsp * 3;
		y += vsp * 3;
	}
//}

instance_destroy();