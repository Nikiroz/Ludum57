var _x = camera_get_view_x(view_camera[0]),
	_y = camera_get_view_y(view_camera[0]);

draw_surface_ext(boatSurface, _x, _y, 1, 1, cos(current_time / 800) / 2 + boatSpeed, c_white, 1)