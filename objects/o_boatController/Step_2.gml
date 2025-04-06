if (isMoving) {
	hsp += boatSpeed;
}

if (hsp > 0) self.move_boat(hsp, vsp);

boatSpeed /= 1.2;

hsp *= 0.8;
