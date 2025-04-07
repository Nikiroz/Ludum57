/// @desc Draw

anim += 0.2
mask_frame += 0.2
mask_frame = mask_frame mod sprite_get_number(sprite_mask)
underwater_frame += 0.2
underwater_frame = underwater_frame mod sprite_get_number(sprite_underwater)

waterline_y = mcr_waterline - 12
wave_amp = 12
wave_y = draw_y
if (is_wave) {
	draw_y = draw_y
} else {
	with (o_water_screen) {
		if (is_wave) {
			other.wave_y = draw_y
		}
	}
}
wave_y += 48//sprite_get_yoffset(sprite_mask) / 6

var _vx = camera_get_view_x(view_camera[0]) - 1,
	_vy = camera_get_view_y(view_camera[0]) - 1,
	_vx2 = _vx + camera_get_view_width(view_camera[0]) + 2,
	_vy2 = _vy + camera_get_view_height(view_camera[0]) + 2;

gpu_push_state()

var _height = sprite_get_height(sprite);
_vy = max(
	waterline_y - (_vy * 0.5 - offset_y * 2) * parallax_y,
	waterline_y
)
// _vy2 = _vy + _height

if (godray_draw) {
	shader_set(shd_godray)
	gpu_set_blendmode(bm_add)
	for (var i = 0; i < godray_count; i ++) {
		shader_set_uniform_f_array(u_gradient, [_vy, sprite_get_height(godray_array[i].sprite)])
		var _to_alpha = 0.2;
		if (
			abs(
				godray_array[i].x + sprite_get_width(godray_array[i].sprite) / 2 -
				(o_ship_part01.x + sprite_get_width(s_ship_part01) / 2)
			) < sprite_get_width(s_ship_part01) / 2
		) {
			_to_alpha = 0
		}
		godray_array[i].alpha = lerp(
			godray_array[i].alpha,
			_to_alpha,
			0.1
		)
		draw_sprite_ext(
			godray_array[i].sprite, 0,
			godray_array[i].x, _vy,
			1, 1, 0, godray_color,
			godray_array[i].alpha// + dcos(current_time * 0.06 + godray_array[i].x) * 0.2
		)
	}
	gpu_set_blendmode(bm_normal)
	shader_reset()
}

gpu_set_tex_repeat(true)
shader_set(shd_water_screen)
gpu_set_tex_repeat(true)

texture_set_stage(
	u_watermask,
	sprite_get_texture(sprite_mask, mask_frame)
)
texture_set_stage(
	u_underwater,
	sprite_get_texture(sprite_underwater, underwater_frame)
)
shader_set_uniform_f_array(
	u_sprite_size,
	[
		sprite_get_width(sprite),
		sprite_get_height(sprite)
	]
)
shader_set_uniform_f_array(
	u_waterdata,
	[
		sprite_get_width(sprite_mask),
		sprite_get_height(sprite_mask),
		0,
		wave_y + 16
	]
)
shader_set_uniform_f_array(
	u_sprite_pos,
	[
		_vx,
		_vy
	]
)
shader_set_uniform_f_array(
	u_underwater_offset,
	[
		underwater_offset[0],
		underwater_offset[1] + 0
	]
)
shader_set_uniform_f_array(
	u_sprite_underwater_size,
	[
		sprite_get_width(sprite_underwater),
		sprite_get_height(sprite_underwater) * underwater_hscale
	]
)
shader_set_uniform_f_array(
	u_view,
	[
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0])
	]
)
shader_set_uniform_f_array(
	u_underwater_parallax,
	[0, 0.1]
)
/*
shader_set_uniform_f_array(
	u_wave_data,
	[wave_y, wave_amp]
)
*/
shader_set_uniform_f(
	u_anim,
	anim
)

draw_sprite_pos(
	sprite, anim,
	_vx, _vy,
	_vx2, _vy,
	_vx2, _vy2,
	_vx, _vy2,
	1
)
draw_x = _vx
draw_y = _vy

shader_reset()

// shader_reset()
/*
texture_set_stage(
	u_texture,
	sprite_get_texture(sprite, 0)
)
var _water_line = o_game_controller.waterlineY - 16;
shader_set_uniform_f_array(
	u_base_y,
	[_water_line + base_y, is_wave, _water_line]
)
shader_set_uniform_f_array(
	u_sprite_size,
	[
		sprite_get_width(sprite),
		sprite_get_height(sprite)
	]
)
shader_set_uniform_f_array(
	u_view,
	[_vx, _vy]
)
shader_set_uniform_f_array(
	u_parallax,
	[parallax_x, parallax_y]
)
shader_set_uniform_f(
	u_anim,
	anim
)

draw_sprite_pos(
	spr_white_pixel, 0,
	_vx, _vy,
	_vx2, _vy,
	_vx2, _vy2,
	_vx, _vy2,
	1
)
*/

gpu_pop_state()