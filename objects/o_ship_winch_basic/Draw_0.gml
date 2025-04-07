if (motion > 0.1) {
	image_index += motion * 0.2;
	motion *= 0.9;
}

event_inherited();
