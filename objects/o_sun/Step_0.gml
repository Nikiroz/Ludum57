angle = (o_game_controller.time + 6) * 15; //+= rotation_speed;

var center_x = camera_get_view_x(view_camera[0]) + (gameWidth / 2);
var center_y = (gameHeight / 2) + 70;

x = center_x + cos(degtorad(angle)) * radius_x;
y = center_y + sin(degtorad(angle)) * radius_y;

//show_debug_message(string(angle))