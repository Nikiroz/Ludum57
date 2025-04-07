/// @desc Update

if (sprite_index != noone) {
	sprite_index = sprite_start
	image_index = 0
	image_speed = 1
}

if (to_end) {
	if (sprite_index == sprite_loop) {
		sprite_index = sprite_end
		image_index = 0
		image_speed = 1
	}
}