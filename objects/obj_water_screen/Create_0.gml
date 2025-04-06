/// @desc Init

base_y = 256
sprite = s_bg_water01
parallax_x = 0.75
parallax_y = 0.75

u_texture = shader_get_sampler_index(shd_water_screen, "u_texture")
u_base_y = shader_get_uniform(shd_water_screen, "u_base_y")
u_sprite_size = shader_get_uniform(shd_water_screen, "u_sprite_size")
u_view = shader_get_uniform(shd_water_screen, "u_view")
u_parallax = shader_get_uniform(shd_water_screen, "u_parallax")