/// @description отрисовка сурфейса
surface_set_target(other.boatSurface)
draw_clear_alpha(c_white, 0)
for (var i=0; i<array_length(boatElements); i++)
	{
		var _inst = boatElements[i];
		
		with (_inst)
		{
			if !visible 
				continue;

			var _xshift = camera_get_view_x(view_camera[0]),
				_yshift = camera_get_view_y(view_camera[0]);

			if (_inst.object_index == o_player)
			{
				draw_levelobject(sprite_index, image_index, x - _xshift, y - _yshift,
					image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			}
			else
				draw_sprite_ext(sprite_index, image_index, x - _xshift, y - _yshift, image_xscale, image_yscale, image_angle, image_blend, image_alpha);


			
		}
		
	}
surface_reset_target()