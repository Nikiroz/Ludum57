/// @description Capture screenshot

application_surface_draw_enable(false);
if (sprite_exists(global.screenshot_sprite)){
	sprite_delete(global.screenshot_sprite)
}

global.screenshot_sprite = sprite_create_from_surface(_surface, 0, 0, view_wport[0], view_hport[0], 0, 0, 0, 0); 
application_surface_draw_enable(true);
/*
var _width = view_wport[0],
	_height = view_hport[0],

	_surface = surface_create(_width, _height)

surface_set_target(_surface)

draw_clear_alpha(c_black, 0)

gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha)

var _w = display_get_gui_width(),
	_h = display_get_gui_height(),
	_xs = _w / _width,
	_ys = _h / _height

draw_surface_ext(application_surface, 0, 0, _xs, _ys, 0, c_white, 1)

gpu_set_blendmode(bm_normal)

//
//with (all) {
//	if (!visible && id != other.id) continue
//	event_perform(ev_draw, ev_draw_normal)
//    event_perform(ev_draw, ev_gui)
//}

surface_reset_target()*/



//sprite_create_from_surface(_surface, 0, 0, _width, _height, 0, 0, 0, 0); 

//surface_free(_surface)

