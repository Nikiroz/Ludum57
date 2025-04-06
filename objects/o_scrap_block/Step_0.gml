event_inherited()

if (is_grounded) {
	if (instance_exists(ground_instance)) {
		float_level = ground_instance.bbox_top;
	}
	else float_level = y;
}

if (submerged) {
	if (abs(float_level - y) > 65) {
		vsp += sign(float_level - y) * (sin(float_wave) + 0.75) * 0.2;
	}
	
	float_wave += 0.05;
}
else vsp += 0.2

image_angle = angle_lerp(image_angle,
	point_direction(x, y, x + hsp, y + vsp) + 90, 0.02)