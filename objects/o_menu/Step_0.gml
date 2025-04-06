var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);

var _offseX = 0;
var _offseY = 0;

if(!global.isPause){
	_offseX = gameWidth;
}

curentOffsetX = lerp(curentOffsetX, _offseX, 0.1);
curentOffsetY = lerp(curentOffsetY, _offseY, 0.1);

x = _x + curentOffsetX;	
y = _y + curentOffsetY;