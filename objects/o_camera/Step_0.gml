if(isFrize){
	exit;
}

if(!view_enabled){
	view_set_wport(0, gameWidth);
	view_set_hport(0, gameHeight);
	view_set_visible(0, true);	
	view_enabled = true;
}


var _camW = camera_get_view_width(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

var localCameraOffsetX = 0;
var localCameraOffsetY = 0;

if(target == self){
	localCameraOffsetY = 10;
}

if(target == o_player){
	if(target.y < mcr_waterline){
		localCameraOffsetY = 20;
	} else {
		localCameraOffsetY = 56; 
	}
}

offsetTargetX = lerp(offsetTargetX, localCameraOffsetX, 0.08);
offsetTargetY = lerp(offsetTargetY, localCameraOffsetY, 0.08);

var _x = target.x - ((_camW / 2) + offsetTargetX);
var _y = target.y - ((_camH / 2) + offsetTargetY);
		
cameraX = round(lerp(cameraX, _x, 0.1));
cameraY = round(lerp(cameraY, _y, 0.1));

cameraX = clamp(cameraX, 0, room_width - camera_get_view_width(view_camera[0]))
cameraY = clamp(cameraY, 0, room_height - camera_get_view_height(view_camera[0]))

camera_set_view_pos(view_camera[0], cameraX, cameraY);
