if (isBoatRender) exit;

shader_set(shd_player)

var _sprite = get_contextual_sprite(sprite_index);

shader_set_uniform_f(u_waterline, mcr_waterline)
shader_set_uniform_f_array(u_color, underwater_color)
shader_set_uniform_f_array(u_lightcolor, lightcolor)
shader_set_uniform_f_array(u_texel, [
	texture_get_texel_width(sprite_get_texture(_sprite, image_index)),
	texture_get_texel_height(sprite_get_texture(_sprite, image_index))
])

draw_levelobject(_sprite, image_index, x, y,
	image_xscale, image_yscale, image_angle, image_blend, image_alpha);

shader_reset();

//if (instance_exists(interaction_object)) {
//	draw_arrow(bbox_center_x, bbox_center_y, interaction_object.x, interaction_object.y, 4)
//}

//if (interaction_time > 0) {
//	if (interaction_time_max > 0) {
//		draw_text(bbox_center_x, bbox_top - 10, $"{interaction_time / interaction_time_max}")
//	}
//	else {
//		draw_text(bbox_center_x, bbox_top - 10, $"{interaction_time}")
//	}
//}
