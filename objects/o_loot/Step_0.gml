if (is_carried) {
	mask_index = msk_none;
	interaction_visible = false;
	exit;
}
else if (mask_index == msk_none) {
	mask_index = object_get_mask(object_index);
	interaction_visible = true;
}

event_inherited();

if (is_grounded && vsp > 0) {
	if (instance_exists(ground_instance)) {
		float_level = lerp(float_level, ground_instance.bbox_top, 0.1);
	}
	else float_level = lerp(float_level, y - 128, 0.1);
}

var _radius = 2, _collision = collision_circle(
		x, y, _radius, o_levelobject, false, true);

if (_collision) {
	var _cx, _cy;
	
	with (_collision) {
		_cx = bbox_center_x;
		_cy = bbox_center_y;
	}
	
	var _vx = ((x - _cx) + random_range(-1, 1)) * 0.1 + _collision.hsp,
		_vy = ((y - _cy) + random_range(-1, 1)) * 0.1 + _collision.vsp
	
	hsp += _vx * 0.5;
	vsp += _vx * 0.5;
	
	if (true && instance_is(_collision, o_loot)) {
		_collision.hsp -= _vx * 0.5;
		_collision.vsp -= _vx * 0.5;
	}
	else {
		var _normal = collision_find_normal(x, y, _radius, _radius, _collision)
		
		if (_normal != undefined) {
			hsp -= _normal[0];
			vsp -= _normal[1];
		}
		else {
			speed_add(1, random(360));
			hsp += _collision.hsp;
		}
	}
	
	speed_limit(2);
}

//
if (is_submerged) {
	if (floating_enabled) {
		if (y > float_level) {
			float_velocity += (float_level - y) * 0.01;
		}
		else float_velocity = lerp(float_velocity, 0.1, 0.1);
		
		vsp += float_velocity;
		
		if (is_grounded && abs(float_velocity) > 0)
			float_velocity = -float_velocity;
		
		float_velocity *= 0.3;
		
		vsp += sin(float_wave) * 0.02;
		
		float_wave += 0.0125;
		
		if (y < float_level) float_level -= 0.05;
		else float_level += sin(float_wave) * 0.05;
	}
	else {
		vsp += 0.05;
	}
}
else {
	var _normal = collision_find_normal(x, bbox_bottom + 1, 5, 3, o_collision);
	
	if (is_struct(_normal)) {
		hsp += _normal[0];
		vsp += _normal[1];
	}
	
	vsp += 0.1;
}

image_angle += hsp * 2 + vsp