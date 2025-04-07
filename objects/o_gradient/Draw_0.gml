x = camera_get_view_x(view_camera[0])

/*
var _blend = gpu_get_blendmode();
gpu_set_blendmode(bm_normal)
draw_self()
gpu_set_blendmode(_blend)
*/
// /*
gpu_push_state()
gpu_set_tex_filter(true)
draw_self()
gpu_pop_state()
// */