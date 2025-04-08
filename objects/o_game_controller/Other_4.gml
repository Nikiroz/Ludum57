application_surface_draw_enable(false);
/*
application_surface_draw_enable(false);
if(global.saveTime > 0){
	time = global.saveTime;
}
*/

if(global.restartTime){
	hour   = startHour;
	time   = startHour;
	global.restartTime=false;
	global.isPause = false;
}

