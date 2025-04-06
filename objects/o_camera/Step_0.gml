if(!view_enabled){
	view_set_wport(0, gameWidth);
	view_set_hport(0, gameHeight);
	view_set_visible(0, true);	
	view_enabled = true;
}

var camW = camera_get_view_width(view_camera[0]);
var camH = camera_get_view_height(view_camera[0]);

var _x = target.x - (camW / 2);
var _y = target.y - (camH / 2) - 70;
		
cameraX = round(lerp(cameraX, _x, 0.2));
cameraY = round(lerp(cameraY, _y, 0.2));

camera_set_view_pos(view_camera[0], cameraX, cameraY);
