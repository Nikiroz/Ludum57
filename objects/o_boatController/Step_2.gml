if (isMoving) {
	hsp += 1 + sin(o_game_controller.time * 0.2) / 3
}

hsp *= 0.8;

if (hsp > 0) self.move_boat(hsp, vsp);
