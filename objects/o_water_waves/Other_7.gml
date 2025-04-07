/// @desc Anim end

if (sprite_index == sprite_start) {
	sprite_index = sprite_loop
	image_index = 0
	image_speed = 1
}

if (sprite_index == sprite_end) {
	instance_destroy()
}