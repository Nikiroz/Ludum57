event_inherited()

if (is_grounded) {
	if (instance_exists(ground_instance)) {
		float_level = ground_instance.bbox_top;
	}
	else float_level = y;
}

if (is_submerged) {
	if (abs(float_level - y) > 65) {
		vsp += sign(float_level - y) * (sin(float_wave) + 0.75) * 0.2;
	}
	
	float_wave += 0.05;
}
else {
	var _normal = collision_find_normal(x, bbox_bottom + 1, 5, 3, o_collision);
	
	if (is_struct(_normal)) {
		hsp += _normal[0];
		vsp += _normal[1];
	}
	
	vsp += 0.1;
}

image_angle = angle_lerp(image_angle,
	point_direction(x, y, x + hsp, y + vsp) + 90, 0.02)