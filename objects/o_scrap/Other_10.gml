if (disassembled) exit;

//repeat (size * random_range(2, 3)) {
	var _loot_type = scr_deicde_loot();
	
	with (instance_create_depth(x, y, depth - 1, _loot_type)) {
		speed_add(random(360), random(3));
		float_level = y - random(32);
		x += hsp * 3;
		y += vsp * 3;
	}
//}

with (interactor) {
	sprite_index = s_player_aquasuit_scavenge_end;
	image_index = 0;
}

var _sprite = asset_get_index(sprite_get_name(sprite_index) + "_disassembled");
if (!sprite_exists(_sprite)) _sprite = s_scrap_small_diassembled;

disassembled = true;
sprite_index = _sprite;
image_index = 0;

mask_index = msk_none;
motion_enabled = false;
interaction_visible = false;
