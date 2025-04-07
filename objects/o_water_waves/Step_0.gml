/// @desc Update

if (sprite_index == noone) {
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

with (o_ship_waves) {
	other.depth = depth + other.offset_depth
}

x = o_ship_waves.x + sprite_get_width(o_ship_waves.sprite_index) / 2 + offset_x * scale_x
y = o_ship_waves.y + offset_y

image_xscale = scale_x