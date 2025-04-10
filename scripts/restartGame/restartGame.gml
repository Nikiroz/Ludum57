function restartGame(){
	room_set_persistent(r_Game, false);
	room_persistent = false;
	audio_stop_all();
	room_goto(INIT);
}