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

//
rendermode_set(Rendermode.Boat);

// Лут за коораблём
for (var i = 0; i < _count; i ++) {
	with (boatElements[i]) {
		
		if !object_is_ancestor(object_index, o_loot) continue;
		event_perform(ev_draw, ev_draw_normal);
	}
}

for (var i = 0; i < _count; i ++) {
	with (boatElements[i]) {
		
		if (!(scr_instance_check_boated(id) && visible)) continue;
		if object_is_ancestor(object_index, o_loot) continue;
		if (instance_is(self, o_levelobject))
		{
			event_perform(ev_draw, ev_draw_normal);
		}
		else if (sprite_exists(sprite_index)) {
			
			//print(object_get_name(object_index))
			
			draw_sprite_ext(sprite_index, image_index, x, y,
				image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		}
	}
}

//
rendermode_reset();

for (var i = _count - 1; i >= 0; i --) {
	with (boatElements[i]) {
		x = __boat_xlast
		y = __boat_ylast
	}
}

surface_reset_target()

