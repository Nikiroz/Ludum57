target		  = (global.isMainMenu ? noone : o_player);
waterlineY	  = mcr_waterline;
offsetTargetX = 0;
offsetTargetY = 20;
fade		  = 1;
depth		  = -1000;
isFrize		  = true;

if(!view_enabled){
	view_set_wport(0, gameWidth);
	view_set_hport(0, gameHeight);
	view_set_visible(0, true);	
	view_enabled = true;
}

camera_set_view_size(view_camera[0], gameWidth, gameHeight);

var _camW	  = camera_get_view_width(view_camera[0]);
var _camH	  = camera_get_view_height(view_camera[0]);

display_set_gui_size(gameWidth, gameHeight);

bg			  = layer_get_id("Background");
cameraX		  = camera_get_view_x(view_camera[0]);
cameraY		  = camera_get_view_y(view_camera[0]);

camera_set_view_pos(view_camera[0], cameraX, cameraY);
