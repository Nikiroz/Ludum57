/// @desc Init

waterline_y = 0
sprite = s_bg_water01
sprite_underwater = s_bg_underwater01
sprite_mask = s_watermask
mask_frame = 0
anim = 0
draw_x = x
draw_y = y
wave_y = draw_y

underwater_frame = 0
underwater_offset = [0, 0]

is_wave = false

parallax_x = 0
parallax_y = 0

underwater_hscale = 1

offset_y = 0

u_sprite_size = shader_get_uniform(shd_water_screen, "u_sprite_size")
u_sprite_pos = shader_get_uniform(shd_water_screen, "u_sprite_pos")
// u_wave_data = shader_get_uniform(shd_water_screen, "u_wave_data")
u_anim = shader_get_uniform(shd_water_screen, "u_anim")
u_underwater = shader_get_sampler_index(shd_water_screen, "u_underwater")
u_watermask = shader_get_sampler_index(shd_water_screen, "u_watermask")
u_waterdata = shader_get_uniform(shd_water_screen, "u_waterdata")
u_sprite_underwater_size = shader_get_uniform(shd_water_screen, "u_sprite_underwater_size")
u_underwater_parallax = shader_get_uniform(shd_water_screen, "u_underwater_parallax")
u_view = shader_get_uniform(shd_water_screen, "u_view")
u_underwater_offset = shader_get_uniform(shd_water_screen, "u_underwater_offset")



godray_draw = true
u_gradient = shader_get_uniform(shd_godray, "u_gradient")
u_godray_watermask = shader_get_sampler_index(shd_godray, "u_watermask")
u_godray_waterdata = shader_get_uniform(shd_godray, "u_waterdata")
godray_color_array = [80, 87, 71]
godray_color_array[0] /= 255
godray_color_array[1] /= 255
godray_color_array[2] /= 255
godray_color = make_color_rgb(80, 87, 71)
godray_count = 12
godray_array = array_create(godray_count)
for (var i = 0; i < godray_count; i ++) {
	godray_array[i] = {
		sprite: choose(
			s_bg_godrays01,
			s_bg_godrays02,
			s_bg_godrays03,
			s_bg_godrays04,
			s_bg_godrays05,
			s_bg_godrays06
		),
		x: (i / godray_count) * room_width + random(64) * choose(-1, 1) + x * 5,
		alpha: 0.2
	}
}

/*
base_y = 0
sprite = s_bg_water01
parallax_x = 0.75
parallax_y = 0.75
is_wave = 1
anim = random(360)

u_texture = shader_get_sampler_index(shd_water_screen, "u_texture")
u_base_y = shader_get_uniform(shd_water_screen, "u_base_y")
u_sprite_size = shader_get_uniform(shd_water_screen, "u_sprite_size")
u_view = shader_get_uniform(shd_water_screen, "u_view")
u_parallax = shader_get_uniform(shd_water_screen, "u_parallax")
u_anim = shader_get_uniform(shd_water_screen, "u_anim")
*/