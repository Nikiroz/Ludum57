global.locale--;
if(global.locale < 0){
	global.locale = Locale.Ua;
}

with(o_label){
	event_user(0);	
}

with(o_button){
	event_user(0);	
}

with(o_slider){
	event_user(0);	
}

with(o_player){
	event_user(1);	
}
with(o_credits){
	event_user(0);	
}