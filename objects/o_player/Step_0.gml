if (is_dead) {
	if(image_index == image_number - 1){

		var targetY = original_y + sin(current_time/1000) * 50;
		y = lerp(y, targetY, 0.02) ;	
	}
	
	exit;
}

if (sprite_index == s_player_oxygentank_change) {
	hsp = 0;
	vsp = 0
	
	exit
}
else if (sprite_index == s_player_aquasuit_ascend) {
	hsp = 0;
	vsp = 0;
	
	if (image_index >= 4) {
		anim_aquasuit_ascend ++;
		
		if (anim_aquasuit_ascend < 15) {
			y -= 3;
			x += 1;
		}
		else lock_next_to_aquasuit();
	}
	
	is_boated = (image_index >= 12);
	
	with (carried_instance)
		is_boated = other.is_boated;
	
	scr_levelobject_updae_dive_splashes();
	
	exit;
}
else if (sprite_index == s_player_aquasuit_exit_drop_item) {
	hsp = 0;
	vsp = 0;
	
	exit;
}
else if (sprite_index == s_player_aquasuit_exit) {
	hsp = 0;
	vsp = 0;
	
	walking = false;
	lock_next_to_aquasuit();
	
	if (image_index >= 14 && aquasuit_equipped) {
		set_aquasuit_state(false);
	}
	
	exit;
}
else if (sprite_index == s_player_aquasuit_enter) {
	hsp = 0;
	vsp = 0;
	
	if (image_index > 32) {
		if (!aquasuit_equipped) {
			set_aquasuit_state(true);
		}
		
		is_boated = false;
		
		if (anim_aquasuit_equip < 5) {
			x -= 5;
			y -= 3;
		}
		else if (anim_aquasuit_equip < 7) {
			x -= 5;
			y += 0.5;
		}
		else {
			x -= 0.5;
			y += 3;
		}
		
		if (bbox_top < mcr_waterline)
			image_index = 34;
		
		anim_aquasuit_equip ++;
	}
	
	scr_levelobject_updae_dive_splashes();
	
	exit;
}
else if (sprite_index == s_player_aquasuit_enter_dive) {
	if (bbox_top < mcr_waterline) {
		y += 3;
	}
	else {
		y += 1;
	}
	
	hsp = 0;
	vsp = 0;
	exit;
}



var _left = false,
	_right = false,
	_hmove = 0;

input_pull_up = false;
input_interact = false;
input_interact2 = false;

if (input_enabled) {
	if (!boat_control && walking_enabled
	&& sprite_index != s_player_aquasuit_swimtoground
	&& sprite_index != s_player_aquasuit_rope_end)
	{
		_left = keyboard_check(ord(leftKey));
		_right = keyboard_check(ord(rightKey));
		_hmove = _right - _left;
	}
	
	input_interact = keyboard_check_pressed(ord(actionKey));
	input_interact2 = keyboard_check_pressed(ord(action2Key));
	input_pull_up = keyboard_check(ord(upKey));
	
	if (input_interact && has_carried_item()) {
		with(carried_instance) {
			hsp += other.facing * 1;
			vsp += 0.5;
		}
		
		set_carried_item(noone);
		input_interact = false;
	}
}

//
if (_hmove != 0) {
	var _spd = movement_speed;
	
	if (abs(hsp) < _spd) {
		hsp += _hmove * _spd;
		
		if (abs(hsp) > _spd) {
			hsp = sign(hsp) * _spd;
		}
	}
	
	walking = true;
	
	facing = _hmove;
}
else {
	walking = false;
}

event_inherited();

if (climb_aboard_confirmation) {
	vsp = (mcr_waterline - bbox_top - 6) * 0.2;
}

x = round(x);

if ((global.isDebug) && mouse_check_button_pressed(mb_middle)) {
	x = mouse_x;
	y = mouse_y;
}

#region Стейтмашина

if (!is_grounded && is_submerged) {
	ungrounded_time ++;
}
else {
	ungrounded_time = 0;
}


if (instance_is(interaction_object, o_scrap) && interaction_time > 0) {
	if (!(sprite_index == s_player_aquasuit_scavenge_start ||
	sprite_index == s_player_aquasuit_scavenge_loop)) {
		sprite_index = s_player_aquasuit_scavenge_start;
		image_index = 0;
	}
	
}
else if (sprite_index != s_player_aquasuit_rope_end) {
	var _swimming = (ungrounded_time > 5);
	
	// остановка анимации сбора
	
	if ((sprite_index == s_player_aquasuit_scavenge_start
	|| sprite_index == s_player_aquasuit_scavenge_loop)) {
		
		if (sprite_index != s_player_aquasuit_scavenge_end) {
			self.animation_reset();
			walking_enabled = true;
		}
	}
	
	// сброс анимации плавания
	if (!_swimming && sprite_index == s_player_aquasuit_swim) {
		self.animation_reset();
	}
	
	if (aquasuit_equipped && is_submerged && _swimming) {
		if (sprite_index != s_player_aquasuit_swim)
			sprite_index = s_player_aquasuit_swim;
	}
	// анимация ходьбы
	else if (walking) {
		if (aquasuit_equipped) {
			sprite_index = s_player_aquasuit_walk;
		}
		else {
			sprite_index = s_player_walk;
			is_boated = true;
			if(isStepPlay(global.soundStepArray)){
				audio_play_sound(getRandomSound(global.soundStepArray), 100, false, global.soundVolume);
			}
		}
	}
	else if (sprite_index == s_player_walk
	|| sprite_index == s_player_aquasuit_walk) {
		self.animation_reset();
	}
}

#endregion

#region Кислород

if (oxygen_refilling) {
	oxygen = lerp(oxygen, oxygen_capacity, 0.33);
	oxygen += 2;
	
	if (oxygen > oxygen_capacity) {
		oxygen_refilling = false;
		oxygen = oxygen_capacity;
	}
}

if (!climb_aboard_confirmation && is_submerged) {
	if (!oxygen_meter_active) {
		oxygen_meter_active = true;
		oxygen = oxygen_capacity;
	}
	
	if (oxygen > 0) {
		oxygen -= oxygenValue;
		
		if (!aquasuit_equipped) oxygen -= 9;
		
		if (!oxygen) put_to_death();
	}
}

if (has_carried_item()) {
	var _tx = facing ? (bbox_right - 4) : bbox_left,
		_ty = bbox_center_y + 4;
	
	with (carried_instance) {
		hsp = other.hsp;
		vsp = other.vsp;
		x = _tx;
		y = _ty;
		
		is_boated = other.is_boated;
	}
}

#endregion

scr_levelobject_updae_dive_splashes();

scr_interaction_update();
