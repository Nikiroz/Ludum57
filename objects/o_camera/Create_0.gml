target = o_player;
waterlineY = mcr_waterline;
offsetTargetX = 0;
offsetTargetY = 20;
fade = 1;
depth = -1000;
isFrize = false;
var _camW = camera_get_view_width(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);
display_set_gui_size(_camW, _camH);

bg = layer_get_id("Background");

cameraX = 0;
cameraY = 0;

var _x = target.x - ((_camW / 2) + offsetTargetX);
var _y = target.y - ((_camH / 2) + offsetTargetY);
		
cameraX = _x;
cameraY = _y;
camera_set_view_pos(view_camera[0], cameraX, cameraY);