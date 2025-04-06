if(!view_enabled){
	view_set_wport(0, gameWidth);
	view_set_hport(0, gameHeight);
	view_set_visible(0, true);	
	view_enabled = true;
}

var _camW = camera_get_view_width(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

var localCameraOffset;

if(target.y < mcr_waterline){
	localCameraOffset = -20;
} else {
	localCameraOffset = -80; 
}

offsetTargetY = lerp(offsetTargetY, localCameraOffset, 0.1);
var _x = target.x - (_camW / 2);
var _y = target.y - (_camH / 2) + offsetTargetY;
		
cameraX = round(lerp(cameraX, _x, 0.1));
cameraY = round(lerp(cameraY, _y, 0.1));

camera_set_view_pos(view_camera[0], cameraX, cameraY);
