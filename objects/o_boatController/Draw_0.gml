var _x = camera_get_view_x(view_camera[0]),
	_y = camera_get_view_y(view_camera[0]);

//TODO: current_time перепривязать к времени в контроллере
draw_surface_ext(boatSurface, _x, _y, 1, 1, cos(o_game_controller.time / 8) * 0.5 + boatSpeed, c_white, 1)
