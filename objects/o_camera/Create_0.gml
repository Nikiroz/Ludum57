target		  = self;
waterlineY	  = mcr_waterline;
offsetTargetX = 0;
offsetTargetY = 20;
fade		  = 1;
depth		  = -1000;
isFrize		  = true;

var _camW	  = camera_get_view_width(view_camera[0]);
var _camH	  = camera_get_view_height(view_camera[0]);

display_set_gui_size(_camW, _camH);

bg			  = layer_get_id("Background");
var offsetY   = global.isMainMenu ? 60 : 0;
cameraX		  = 0;
cameraY		  = 0;
var _x		  = o_player.x - ((_camW / 2) + offsetTargetX);
var _y		  = o_player.y - ((_camH / 2) + offsetTargetY + offsetY);	
cameraX		  = _x;
cameraY		  = _y;

camera_set_view_pos(view_camera[0], cameraX, cameraY);
