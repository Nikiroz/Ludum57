isVisible = true;

if (global.money < 0){
	instance_create_layer(0, 0, "UI", o_button_restart_button)
} else {
	instance_create_layer(0, 0, "UI", o_button_next_day);
}
