var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
	
if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(_mouseX, _mouseY, 
        _x, _y, _x + width, _y + height)) {
        isGrabbed = true;
    }
}

if(mouse_check_button_released(mb_left)){
	isGrabbed = false;
}

if(isGrabbed){
    _value = clamp((_mouseX - _x) / width, 0, 1);
}