angle += rotation_speed;

var center_x = camera_get_view_x(view_camera[0]) + (gameWidth / 2);
var center_y = (gameHeight / 2) + 70;

x = center_x + cos(angle) * radius_x;
y = center_y + sin(angle) * radius_y;

//show_debug_message(string(angle))