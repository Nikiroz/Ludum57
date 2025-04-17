application_surface_draw_enable(false);
room_persistent = false;
if(global.isRestart){
	global.isRestart = false;
	
	with(o_sound_controller){
		event_user(1);	
		event_user(0);	
	}
	
	room_goto(INIT);

}