event_inherited()

if (!is_grounded) {
	vsp += 0.05;
}
else if (is_submerged) {
	vsp += 0.01;
}
else vsp = 0;

if (instance_exists(rope_instance)) {
	rope_instance.x = x;
	rope_instance.y = y;
}