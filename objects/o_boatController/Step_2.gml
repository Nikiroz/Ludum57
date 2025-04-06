/// @description отрисовка сурфейса

if (!surface_exists(boatSurface)) self.__reset_surface();

surface_set_target(boatSurface);
draw_clear_alpha(c_white, 0)

var _count = array_length(boatElements),
	_xshift = camera_get_view_x(view_camera[0]),
	_yshift = camera_get_view_y(view_camera[0]);

for (var i = _count - 1; i >= 0; i --) {
	with (boatElements[i]) {
		__boat_xlast = x
		__boat_ylast = y
		
		x -= _xshift
		y -= _yshift
	}
}

for (var i = 0; i < _count; i ++) {
	with (boatElements[i]) {
		if (!(scr_instance_check_boated(id) && visible)) continue;
		
		if (instance_is(self, o_levelobject))
		{
			is_boated = false;
			
			event_perform(ev_draw, ev_draw_normal);
			
			is_boated = true;
		}
		else if (sprite_index >= 0) {
			
			draw_sprite_ext(sprite_index, image_index, x, y,
				image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		}
	}
}

for (var i = _count - 1; i >= 0; i --) {
	with (boatElements[i]) {
		x = __boat_xlast
		y = __boat_ylast
	}
}

surface_reset_target()