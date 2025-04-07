/// @desc Update

if (dir_x > 0) {
	if (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])) {
		instance_destroy()
	}
} else {
	if (x < camera_get_view_x(view_camera[0])) {
		instance_destroy()
	}
}
/*
if (time > 0) {
	time --
} else {
	instance_destroy()
}
*/