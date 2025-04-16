room_persistent = true;
if (room==r_Game && !o_player.is_dead){
	event_user(0);
	room_goto(r_Pause);
}