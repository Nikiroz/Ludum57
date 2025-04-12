function restartGame(){
	room_set_persistent(r_Game, false);
	room_persistent = false;
	room_goto(INIT);
}