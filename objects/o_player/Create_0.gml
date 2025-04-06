vsp = 0;
horsp = 0;

draw_set_font(fnt_debug);

rope_instance = noone;

is_climbing_rope = function() {
	return instance_exists(rope_instance);
}
