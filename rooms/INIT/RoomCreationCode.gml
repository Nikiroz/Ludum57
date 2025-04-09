room_set_persistent(r_Game, true);
global.rope_upgrade = true;
global.money = 0;
global.dayNumbers = 1;
global.restartTime=false;
global.screenshot_sprite = -1;
show_debug_message("INIT")
room_goto(r_Game)