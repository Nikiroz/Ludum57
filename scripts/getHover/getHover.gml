function getHover(){
	var _mouseX = device_mouse_x_to_gui(0);
	var _mouseY = device_mouse_y_to_gui(0);
	
	return point_in_rectangle(_mouseX, _mouseY, _x, _y, _x + width, _y + height);
}