x = camera_get_view_x(view_camera[0])

gpu_push_state()
gpu_set_tex_filter(true)
draw_self()
gpu_pop_state()