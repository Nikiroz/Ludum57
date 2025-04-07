if (global.money < 0) 
{
	with (o_room_change_button) instance_destroy()
	
	with instance_create_layer(480, 256, "Gui", o_game_restart_button) {
		depth -= 10;
	}
		
}