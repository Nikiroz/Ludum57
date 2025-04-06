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

is_wave = false

parallax_x = 0
parallax_y = 0

offset_y = 0

u_sprite_size = shader_get_uniform(shd_water_screen, "u_sprite_size")
u_sprite_pos = shader_get_uniform(shd_water_screen, "u_sprite_pos")
// u_wave_data = shader_get_uniform(shd_water_screen, "u_wave_data")
u_anim = shader_get_uniform(shd_water_screen, "u_anim")
u_underwater = shader_get_sampler_index(shd_water_screen, "u_underwater")
u_watermask = shader_get_sampler_index(shd_water_screen, "u_watermask")
u_waterdata = shader_get_uniform(shd_water_screen, "u_waterdata")

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